//
//  TestCollectionViewFlowLayout.m
//  TestCollectionViewLayout
//
//  Created by 胡 文杰 on 6/7/14.
//  Copyright (c) 2014 胡 文杰. All rights reserved.
//

#import "ADPaintCollectionViewFlowLayout.h"
@interface ADPaintCollectionViewFlowLayout()
{
    NSUInteger countRow;
    NSUInteger countColumn;
    CGFloat interItemSpacing;
    CGFloat lineSpacing;
    CGFloat pageWidth;
}
@end
@implementation ADPaintCollectionViewFlowLayout

//- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
//{
//    return YES;
//}


-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    DebugLogFuncStart(@"layoutAttributesForElementsInRect rect %@", NSStringFromCGRect(rect));
    
    //修正layout的rect,保证纵向转横向后不缺少元素
    //FIXME: + 1是补丁做法
    CGRect fixedRect = rect;
//    fixedRect.size.width = (ceilf(rect.size.width / self.collectionView.bounds.size.width) + floorf(rect.origin.x / self.collectionView.bounds.size.width)) * self.collectionView.bounds.size.width;
//    fixedRect.origin.x = floorf(rect.origin.x / self.collectionView.bounds.size.width) * self.collectionView.bounds.size.width;
    DebugLog(@"numberOfItemsInSection %i", [self.collectionView numberOfItemsInSection:0]);
    CGFloat width = ceilf((float)[self.collectionView numberOfItemsInSection:0] / 9.0) * 1024;
//    width = ceilf(width / 1024.0) * 1024;
    fixedRect.size.width = width;
    fixedRect.origin.x = 0;
    DebugLog(@"fixedRect %@", NSStringFromCGRect(fixedRect));

    NSArray* array = [super layoutAttributesForElementsInRect:fixedRect];
    if (array.count == 0) {
        return array;
    }
    
    DebugLog(@"array.count %lu", (unsigned long)array.count);
    UICollectionViewLayoutAttributes* attributes = (UICollectionViewLayoutAttributes*)array[0];
    [self prepareCalculateAttributeFrame:attributes];
    
    for (UICollectionViewLayoutAttributes* attributes in array) {
        [self calculateAttributeFrame:attributes];
    }
    
    return array;
}
- (void)prepareCalculateAttributeFrame:(UICollectionViewLayoutAttributes*)attributes{
    countRow = (NSUInteger)self.collectionView.bounds.size.width / attributes.size.width;
    countColumn = (NSUInteger)self.collectionView.bounds.size.height / attributes.size.height;
    pageWidth = self.collectionView.bounds.size.width;
    //    NSLog(@"countRow %zu countColumn %zu", countRow, countColumn);
    
    if (countRow > 1) {
        interItemSpacing = (self.collectionView.bounds.size.width - self.sectionInset.left - self.sectionInset.right - countRow * attributes.size.width) / (CGFloat)(countRow - 1);
        interItemSpacing = MAX(interItemSpacing, self.minimumInteritemSpacing);
    }
    
    if (countColumn > 1) {
        lineSpacing = (self.collectionView.bounds.size.height - self.sectionInset.top - self.sectionInset.bottom - countColumn * attributes.size.height) / (CGFloat)(countColumn - 1);
        lineSpacing = MAX(lineSpacing, self.minimumLineSpacing);
    }
}
- (void)calculateAttributeFrame:(UICollectionViewLayoutAttributes*)attributes{
    NSUInteger index = attributes.indexPath.row;
    NSUInteger indexInPage = (NSUInteger)fmod(index, countRow * countColumn);
    NSUInteger pageIndex = (NSUInteger)floor((float)index / (countRow * countColumn));
    //        NSLog(@"pageIndex %zu indexInPage %zu", pageIndex, indexInPage);
    //        NSLog(@"frame %@", NSStringFromCGRect(attributes.frame));
    
    NSUInteger indexRowInPage = fmod(indexInPage, countRow);
    NSUInteger indexColInPage = floor((float)indexInPage / (float)countRow);
    
    CGFloat x = self.sectionInset.left + indexRowInPage * attributes.size.width + interItemSpacing * indexRowInPage + pageIndex * pageWidth;
    CGFloat y = self.sectionInset.top + indexColInPage * attributes.size.height + lineSpacing * indexColInPage;
    
    CGFloat width = attributes.size.width;
    CGFloat height = attributes.size.height;
    attributes.frame = CGRectMake(x, y, width, height);
}

- (CGSize)collectionViewContentSize{
//    DebugLogFuncStart(@"collectionViewContentSize")
    countRow = (NSUInteger)self.collectionView.bounds.size.width / self.itemSize.width;
    countColumn = (NSUInteger)self.collectionView.bounds.size.height / self.itemSize.height;
    NSUInteger countPage = ceilf((float)[self.collectionView numberOfItemsInSection:0] / (float)(countRow * countColumn));
    //    NSLog(@"countPage %zu", countPage);
    CGSize size = CGSizeMake(countPage * self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    //    NSLog(@"size %@", NSStringFromCGSize(size));
    return size;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    NSUInteger pageIndex = (NSUInteger)ceilf(proposedContentOffset.x / self.collectionView.bounds.size.width);
    //    NSLog(@"pageIndex %zu", pageIndex);
    CGPoint targetOffset = CGPointMake(pageIndex * self.collectionView.bounds.size.width, 0);
    return targetOffset;
}

- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath{
//    DebugLogSystem(@"initialLayoutAttributesForAppearingItemAtIndexPath row %d", itemIndexPath.row);
    UICollectionViewLayoutAttributes *attribute = [super initialLayoutAttributesForAppearingItemAtIndexPath:itemIndexPath];
    [self calculateAttributeFrame:attribute];
//    DebugLogWarn(@"attribute %@", NSStringFromCGRect(attribute.frame));
    return attribute;
}
@end
