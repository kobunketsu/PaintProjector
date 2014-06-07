//
//  TestCollectionViewFlowLayout.m
//  TestCollectionViewLayout
//
//  Created by 胡 文杰 on 6/7/14.
//  Copyright (c) 2014 胡 文杰. All rights reserved.
//

#import "PaintCollectionViewFlowLayout.h"

@implementation PaintCollectionViewFlowLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
    return YES;
}


-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSLog(@"layoutAttributesForElementsInRect rect %@", NSStringFromCGRect(rect));
    
    //修正layout的rect,保证纵向转横向后不缺少元素
    CGRect fixedRect = rect;
    fixedRect.size.width = ceilf(rect.size.width / self.collectionView.bounds.size.width) * self.collectionView.bounds.size.width;
    fixedRect.origin.x = floorf(rect.origin.x / self.collectionView.bounds.size.width) * self.collectionView.bounds.size.width;
    //    NSLog(@"fixedRect %@", NSStringFromCGRect(fixedRect));
    
    NSArray* array = [super layoutAttributesForElementsInRect:fixedRect];
    if (array.count == 0) {
        return array;
    }
    
    //    NSLog(@"array.count %lu", (unsigned long)array.count);
    UICollectionViewLayoutAttributes* attributes = (UICollectionViewLayoutAttributes*)array[0];
    NSUInteger countRow = (NSUInteger)self.collectionView.bounds.size.width / attributes.size.width;
    NSUInteger countColumn = (NSUInteger)self.collectionView.bounds.size.height / attributes.size.height;
    
    CGFloat pageWidth = self.collectionView.bounds.size.width;
    //    NSLog(@"countRow %zu countColumn %zu", countRow, countColumn);
    
    CGFloat interItemSpacing = 0; CGFloat lineSpacing = 0;
    if (countRow > 1) {
        interItemSpacing = (self.collectionView.bounds.size.width - self.sectionInset.left - self.sectionInset.right - countRow * attributes.size.width) / (CGFloat)(countRow - 1);
        interItemSpacing = MAX(interItemSpacing, self.minimumInteritemSpacing);
    }
    
    if (countColumn > 1) {
        lineSpacing = (self.collectionView.bounds.size.height - self.sectionInset.top - self.sectionInset.bottom - countColumn * attributes.size.height) / (CGFloat)(countColumn - 1);
        lineSpacing = MAX(lineSpacing, self.minimumLineSpacing);
    }
    
    for (int i =0; i < array.count; ++i) {
        UICollectionViewLayoutAttributes* attributes = (UICollectionViewLayoutAttributes*)array[i];
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
    
    return array;
}


- (CGSize)collectionViewContentSize{
    NSUInteger countRow = (NSUInteger)self.collectionView.bounds.size.width / self.itemSize.width;
    NSUInteger countColumn = (NSUInteger)self.collectionView.bounds.size.height / self.itemSize.height;
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

@end
