//
//  OpenGLWaveFrontObject.m
//  Wavefront OBJ Loader
//
//  Created by Jeff LaMarche on 12/14/08.
//  Copyright 2008 Jeff LaMarche. All rights reserved.
//
// This file will load certain .obj files into memory and display them in OpenGL ES.
// Because of limitations of OpenGL ES, not all .obj files can be loaded - faces larger
// than triangles cannot be handled, so files must be exported with only triangles.


#import "OpenGLWaveFrontObject.h"
#import "ConstantsAndMacros.h"
#import "OpenGLWaveFrontMesh.h"
#import "OpenGLWaveFrontMaterial.h"
#import "OpenGLTexture3D.h"

static inline void	processOneVertex(VertexTextureIndex *rootNode, GLuint vertexIndex, GLuint vertexTextureIndex, GLuint *vertexCount, Vertex3D	*vertices, GLfloat  *allTextureCoords, GLfloat *textureCoords, GLuint componentsPerTextureCoord, GLushort *faceVertexIndex)
{
	//NSLog(@"Processing Vertex: %d, Texture Index: %d", vertexIndex, vertexTextureIndex);
	BOOL alreadyExists = VertexTextureIndexContainsVertexIndex(rootNode, vertexIndex);
	VertexTextureIndex *vertexNode = VertexTextureIndexAddNode(rootNode, vertexIndex, vertexTextureIndex);
	if (vertexNode->actualVertex == UINT_MAX)
	{
		if (!alreadyExists || rootNode == vertexNode)
		{
			
			vertexNode->actualVertex = vertexNode->originalVertex;
			
			// Wavefront's texture coord order is flip-flopped from what OpenGL expects
			for (int i = 0; i < componentsPerTextureCoord; i++)
				textureCoords[(vertexNode->actualVertex * componentsPerTextureCoord) + i] = allTextureCoords[(vertexNode->textureCoords * componentsPerTextureCoord) + i] ;

			
		}
		else
		{
			vertices[*vertexCount].x = vertices[vertexNode->originalVertex].x;
			vertices[*vertexCount].y = vertices[vertexNode->originalVertex].y;
			vertices[*vertexCount].z = vertices[vertexNode->originalVertex].z;
			vertexNode->actualVertex = *vertexCount;
			
			for (int i = 0; i < componentsPerTextureCoord; i++)
				textureCoords[(vertexNode->actualVertex * componentsPerTextureCoord) + i] = allTextureCoords[(vertexNode->textureCoords * componentsPerTextureCoord) + i];
			*vertexCount = *vertexCount + 1;
		}
	}
	*faceVertexIndex = vertexNode->actualVertex;
}

@interface OpenGLWaveFrontObject (private)
- (void)calculateNormals;
@end

@implementation OpenGLWaveFrontObject
@synthesize sourceObjFilePath;
@synthesize sourceMtlFilePath;
@synthesize numberOfVertices;
@synthesize numberOfFaces;
@synthesize vertices;
@synthesize vertexNormals;
@synthesize currentPosition;
@synthesize currentRotation;
@synthesize materials;
@synthesize meshes;
- (id)initWithPath:(NSString *)path
{
	
	if ((self = [super init]))
	{
		self.meshes = [NSMutableArray array];
		
		self.sourceObjFilePath = path;
        //读取整个数据字符串
        NSError *error;NSStringEncoding encoding;
		NSString *objData = [NSString stringWithContentsOfFile:path usedEncoding:&encoding error:&error];
		NSUInteger vertexCount = 0, faceCount = 0, textureCoordsCount=0, meshCount = 0;
        //第一遍遍历取得模型整体数据，顶点数，法线数，三角面数等
		// Iterate through file once to discover how many vertices, normals, and faces there are
		NSArray *lines = [objData componentsSeparatedByString:@"\n"];
		BOOL firstTextureCoords = YES;
		NSMutableArray *vertexCombinations = [[NSMutableArray alloc] init];
		for (NSString * line in lines)
		{
			if ([line hasPrefix:@"v "])
				vertexCount++;
			else if ([line hasPrefix:@"vt "])
			{
				textureCoordsCount++;
				if (firstTextureCoords)
				{
					firstTextureCoords = NO;
					NSString *texLine = [line substringFromIndex:3];
					NSArray *texParts = [texLine componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
					valuesPerCoord = [texParts count]-1;//切掉uv中的w
				}
			}
			else if ([line hasPrefix:@"m"])
			{
				NSString *truncLine = [line substringFromIndex:7];
				self.sourceMtlFilePath = truncLine;
				NSString *mtlPath = [[NSBundle mainBundle] pathForResource:[[truncLine lastPathComponent] stringByDeletingPathExtension] ofType:[truncLine pathExtension]];
				self.materials = [OpenGLWaveFrontMaterial materialsFromMtlFile:mtlPath];
			}
			else if ([line hasPrefix:@"g"])
				meshCount++;
			else if ([line hasPrefix:@"f"])
			{
				faceCount++;
				NSString *faceLine = [line substringFromIndex:2];
				NSArray *faces = [faceLine componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
				for (NSString *oneFace in faces)
				{
					NSArray *faceParts = [oneFace componentsSeparatedByString:@"/"];
					
					NSString *faceKey = [NSString stringWithFormat:@"%@/%@", [faceParts objectAtIndex:0], ([faceParts count] > 1) ? [faceParts objectAtIndex:1] : 0];
					if (![vertexCombinations containsObject:faceKey])
						[vertexCombinations addObject:faceKey];
				}
			}
			
		}
		vertices = malloc(sizeof(Vertex3D) *  [vertexCombinations count]);
		GLfloat *allTextureCoords = malloc(sizeof(GLfloat) *  textureCoordsCount * valuesPerCoord);
		textureCoords = (textureCoordsCount > 0) ?  malloc(sizeof(GLfloat) * valuesPerCoord * [vertexCombinations count]) : NULL;
		// Store the counts
		numberOfFaces = (GLuint)faceCount;
		numberOfVertices = (GLuint)[vertexCombinations count];
		GLuint allTextureCoordsCount = 0;
		textureCoordsCount = 0;
		GLuint meshFaceCount = 0;
		GLuint meshCoordCount = 0;
        
        //第二遍遍历填充模型数据，顶点，法线，三角面等
		// Reuse our count variables for second time through
		vertexCount = 0;
		faceCount = 0;
		OpenGLWaveFrontMesh *currentMesh = nil;
		NSUInteger lineNum = 0;
		BOOL usingmeshes = YES;
		
		VertexTextureIndex *rootNode = nil;
		for (NSString * line in lines)
		{
			if ([line hasPrefix:@"v "])
			{
				NSString *lineTrunc = [line substringFromIndex:3];
				NSArray *lineVertices = [lineTrunc componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
				vertices[vertexCount].x = [[lineVertices objectAtIndex:0] floatValue];
				vertices[vertexCount].y = [[lineVertices objectAtIndex:1] floatValue];
				vertices[vertexCount].z = [[lineVertices objectAtIndex:2] floatValue];
				// Ignore weight if it exists..
				vertexCount++;
			}
			else if ([line hasPrefix: @"vt "])
			{
				NSString *lineTrunc = [line substringFromIndex:3];
				NSArray *lineCoords = [lineTrunc componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
				int coordCount = 0;
				for (NSString *oneCoord in lineCoords)
				{
                    if(coordCount>=2)//切掉uv中的w
                    {
                        break;
                    }
                    //反转Y坐标
					if (valuesPerCoord == 2 /* using UV Mapping */ && coordCount == 1 /* is Y value */)
						allTextureCoords[allTextureCoordsCount] = 1.0 - ([oneCoord floatValue]);
					else
						allTextureCoords[allTextureCoordsCount] = [oneCoord floatValue];
					//NSLog(@"Setting allTextureCoords[%d] to %f", allTextureCoordsCount, [oneCoord floatValue]);
                    
					allTextureCoordsCount++;
                    coordCount++;
				}
				
				// Ignore weight if it exists..
				textureCoordsCount++;
			}
			else if ([line hasPrefix:@"g "])
			{
				NSString *geometryName = [line substringFromIndex:2];
				NSUInteger counter = lineNum+1;
				
				while (counter < [lines count])
				{
					NSString *nextLine = [lines objectAtIndex:counter++];
                    NSString *materialName = nil;
                    //遍历当前geometry
					if ([nextLine hasPrefix:@"g "])
						break;  
                    
                    //找到usemtl
					if ([nextLine hasPrefix:@"usemtl "])
                    {
                        materialName = [nextLine substringFromIndex:7];
                        NSUInteger counter2 = counter+1;
                        NSUInteger currentMeshFaceCount = 0;
                        //遍历到当前usemtl,读取subMesh面数
                        while (counter2 < [lines count])
                        {
                            NSString *nextLine2 = [lines objectAtIndex:counter2++];
                            if ([nextLine2 hasPrefix:@"usemtl "])
                            {
                                break;
                            }                            
                            if ([nextLine2 hasPrefix:@"f "])
                            {
                                // TODO: Loook for quads and double-increment
                                currentMeshFaceCount ++;
                            }

                        }
                        //读取当前材质
                        OpenGLWaveFrontMaterial *material = [materials objectForKey:materialName] ;
                        if (material == nil)
                            material = [OpenGLWaveFrontMaterial defaultMaterial];
                        //初始化当前subMesh
                        NSString *subMeshName = [geometryName stringByAppendingString:(materialName)];
                        
                        currentMesh = [[OpenGLWaveFrontMesh alloc] initWithName:subMeshName
                                                                    numberOfFaces:currentMeshFaceCount 
                                                                         material:material];
                        [meshes addObject:currentMesh];
                        meshFaceCount = 0;
                        meshCoordCount = 0;
                        
                    }//创建好mesh，设置完材质，填充face数据
                    else if ([nextLine hasPrefix:@"f "])
                    {
                        NSString *lineTrunc = [nextLine substringFromIndex:2];
                        NSArray *faceIndexmeshes = [lineTrunc componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                        
                        // If no meshes in file, create one mesh that has all the vertices and uses the default material
                        if (currentMesh == nil)
                        {
                            OpenGLWaveFrontMaterial *tempMaterial = nil;
                            NSArray *materialKeys = [materials allKeys];
                            if ([materialKeys count] == 2)
                            {
                                // 2 means there's one in file, plus default
                                for (NSString *key in materialKeys)
                                    if (![key isEqualToString:@"default"])
                                        tempMaterial = [materials objectForKey:key];
                            }
                            if (tempMaterial == nil)
                                tempMaterial = [OpenGLWaveFrontMaterial defaultMaterial];
                            
                            currentMesh = [[OpenGLWaveFrontMesh alloc] initWithName:@"default"
                                                                        numberOfFaces:numberOfFaces 
                                                                             material:tempMaterial];
                            [meshes addObject:currentMesh];
                            usingmeshes = NO;
                        }
                        
                        // TODO: Look for quads and build two triangles
                        
                        NSArray *vertex1Parts = [[faceIndexmeshes objectAtIndex:0] componentsSeparatedByString:@"/"];
                        GLuint vertex1Index = [[vertex1Parts objectAtIndex:kGroupIndexVertex] intValue]-1;
                        GLuint vertex1TextureIndex = 0;
                        if ([vertex1Parts count] > 1)
                            vertex1TextureIndex = [[vertex1Parts objectAtIndex:kGroupIndexTextureCoordIndex] intValue]-1;
                        if (rootNode == NULL)
                            rootNode =  VertexTextureIndexMake(vertex1Index, vertex1TextureIndex, UINT_MAX);
                        
                        processOneVertex(rootNode, vertex1Index, vertex1TextureIndex, &vertexCount, vertices, allTextureCoords, textureCoords, valuesPerCoord, &(currentMesh.faces[meshFaceCount].v1));
                        NSArray *vertex2Parts = [[faceIndexmeshes objectAtIndex:1] componentsSeparatedByString:@"/"];
                        processOneVertex(rootNode, [[vertex2Parts objectAtIndex:kGroupIndexVertex] intValue]-1, [vertex2Parts count] > 1 ? [[vertex2Parts objectAtIndex:kGroupIndexTextureCoordIndex] intValue]-1 : 0, &vertexCount, vertices, allTextureCoords, textureCoords, valuesPerCoord, &currentMesh.faces[meshFaceCount].v2);	
                        NSArray *vertex3Parts = [[faceIndexmeshes objectAtIndex:2] componentsSeparatedByString:@"/"];
                        processOneVertex(rootNode, [[vertex3Parts objectAtIndex:kGroupIndexVertex] intValue]-1, [vertex3Parts count] > 1 ? [[vertex3Parts objectAtIndex:kGroupIndexTextureCoordIndex] intValue]-1 : 0, &vertexCount, vertices, allTextureCoords, textureCoords, valuesPerCoord, &currentMesh.faces[meshFaceCount].v3);
                        
                        faceCount++;
                        meshFaceCount++;
                    }
				}
			}
            
			lineNum++;
			
		}
		//NSLog(@"Final vertex count: %d", vertexCount);
		
		[self calculateNormals];
		if (allTextureCoords)
			free(allTextureCoords);
		VertexTextureIndexFree(rootNode);
        
	}
	return self;
}

/*
- (void)drawSelf
{
	// Save the current transformation by pushing it on the stack
	glPushMatrix();
	
	// Load the identity matrix to restore to origin
	//glLoadIdentity();
	
	// Translate to the current position
	//glTranslatef(currentPosition.x, currentPosition.y, currentPosition.z);
    //glLoadMatrixf(&modelViewMatrix.m);
    GLKMatrix4 modelMatrix = GLKMatrix4MakeTranslation(currentPosition.x, currentPosition.y, currentPosition.z);
    glMultMatrixf(&modelMatrix.m);
    
	
	// Rotate to the current rotation
//	glRotatef(currentRotation.x, 1.0, 0.0, 0.0);
//	glRotatef(currentRotation.y, 0.0, 1.0, 0.0);
//	glRotatef(currentPosition.z, 0.0, 0.0, 1.0);
    glDisable(GL_BLEND);
	// Enable and load the vertex array
	glEnableClientState(GL_VERTEX_ARRAY);
	glEnableClientState(GL_NORMAL_ARRAY);
	glVertexPointer(3, GL_FLOAT, 0, vertices); 
	glNormalPointer(GL_FLOAT, 0, vertexNormals);
	// Loop through each mesh
	
	if (textureCoords != NULL)
	{
		glEnableClientState(GL_TEXTURE_COORD_ARRAY);
		glTexCoordPointer(valuesPerCoord, GL_FLOAT, 0, textureCoords);
	}
	for (OpenGLWaveFrontMesh *mesh in meshes)
	{
		if (textureCoords != NULL && mesh.material.texture != nil)
			[mesh.material.texture bind];
		// Set color and materials based on mesh's material
		Color3D ambient = mesh.material.ambient;
		glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT, (const GLfloat *)&ambient);
		
		Color3D diffuse = mesh.material.diffuse;
		glColor4f(diffuse.red, diffuse.green, diffuse.blue, diffuse.alpha);
		glMaterialfv(GL_FRONT_AND_BACK, GL_DIFFUSE,  (const GLfloat *)&diffuse);
		
		Color3D specular = mesh.material.specular;
		glMaterialfv(GL_FRONT_AND_BACK, GL_SPECULAR, (const GLfloat *)&specular);
		
		glMaterialf(GL_FRONT_AND_BACK, GL_SHININESS, mesh.material.shininess);
		
		glDrawElements(GL_TRIANGLES, 3*mesh.numberOfFaces, GL_UNSIGNED_SHORT, &(mesh.faces[0]));
	}
	if (textureCoords != NULL)
		glDisableClientState(GL_TEXTURE_COORD_ARRAY);
	
	glDisableClientState(GL_VERTEX_ARRAY);
	glDisableClientState(GL_NORMAL_ARRAY);
	// Restore the current transformation by popping it off
	glPopMatrix();
}
*/

- (void)calculateNormals
{
	if (surfaceNormals)
		free(surfaceNormals);	
	
	// Calculate surface normals and keep running sum of vertex normals
	surfaceNormals = calloc(numberOfFaces, sizeof(Vector3D));
	vertexNormals = calloc(numberOfVertices, sizeof(Vector3D));
	NSUInteger index = 0;
	NSUInteger *facesUsedIn = calloc(numberOfVertices, sizeof(NSUInteger)); // Keeps track of how many triangles any given vertex is used in
    //遍历所有subMesh
	for (int i = 0; i < [meshes count]; i++)
	{
		OpenGLWaveFrontMesh *oneMesh = [meshes objectAtIndex:i];
        //遍历所有三角面
		for (int j = 0; j < oneMesh.numberOfFaces; j++)
		{
			Triangle3D triangle = Triangle3DMake(vertices[oneMesh.faces[j].v1], vertices[oneMesh.faces[j].v2], vertices[oneMesh.faces[j].v3]);
			//计算出每个三角面的法线
			surfaceNormals[index] = Triangle3DCalculateSurfaceNormal(triangle);
#ifdef USE_FAST_NORMALIZE
			Vector3DFastNormalize(&surfaceNormals[index]);
#else
			Vector3DNormalize(&surfaceNormals[index]);
#endif
            //计算当前subMesh的当前三角面对应的顶点索引号索引的顶点法线 加当前三角面法线
			vertexNormals[oneMesh.faces[j].v1] = Vector3DAdd(surfaceNormals[index], vertexNormals[oneMesh.faces[j].v1]);
			vertexNormals[oneMesh.faces[j].v2] = Vector3DAdd(surfaceNormals[index], vertexNormals[oneMesh.faces[j].v2]);
			vertexNormals[oneMesh.faces[j].v3] = Vector3DAdd(surfaceNormals[index], vertexNormals[oneMesh.faces[j].v3]);
			//计算每个顶点的连接面数
			facesUsedIn[oneMesh.faces[j].v1]++;
			facesUsedIn[oneMesh.faces[j].v2]++;
			facesUsedIn[oneMesh.faces[j].v3]++;
			
			index++;
		}
	}
	
	// Loop through vertices again, dividing those that are used in multiple faces by the number of faces they are used in
	for (int i = 0; i < numberOfVertices; i++)
	{
		if (facesUsedIn[i] > 1)
		{
			vertexNormals[i].x /= facesUsedIn[i];
			vertexNormals[i].y /= facesUsedIn[i];
			vertexNormals[i].z /= facesUsedIn[i];
		}
#ifdef USE_FAST_NORMALIZE
		Vector3DFastNormalize(&vertexNormals[i]);
#else
		Vector3DNormalize(&vertexNormals[i]);
#endif
	}
	free(facesUsedIn);
}

- (void)dealloc
{
	if (vertices)
		free(vertices);
	if (surfaceNormals)
		free(surfaceNormals);
	if (vertexNormals)
		free(vertexNormals);
	if (textureCoords)
		free(textureCoords);
}

- (OBJVertex*)convertVertexStruct{
    OBJVertex *v = malloc(sizeof(OBJVertex) *  numberOfVertices);
    for (uint i=0; i < numberOfVertices; i++) {
        v[i].Position[0] = vertices[i].x;
        v[i].Position[1] = vertices[i].y;
        v[i].Position[2] = vertices[i].z;
//        DebugLog(@"vertex %d Position x:%.2f y:%.2f z:%.2f", i, v[i].Position[0], v[i].Position[1], v[i].Position[2]);
        
        v[i].Texcoord[0] = textureCoords[i * 2];
        v[i].Texcoord[1] = textureCoords[i * 2 + 1];
//        DebugLog(@"vertex %d Texcoord x:%.2f y:%.2f", i, v[i].Texcoord[0], v[i].Texcoord[1]);
        
        v[i].Normal[0] = vertexNormals[i].x;
        v[i].Normal[1] = vertexNormals[i].y;
        v[i].Normal[2] = vertexNormals[i].z;
//        DebugLog(@"vertex %d Normal x:%.2f y:%.2f z:%.2f", i, v[i].Normal[0], v[i].Normal[1], v[i].Normal[2]);
    }

    return v;
}

@end
