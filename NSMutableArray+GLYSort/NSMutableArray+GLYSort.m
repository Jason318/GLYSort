//
//  NSMutableArray+GLYSort.m
//  RecursionDemo
//
//  Created by Jason on 2018/12/19.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import "NSMutableArray+GLYSort.h"

@implementation NSMutableArray (GLYSort)

#pragma mark -
#pragma mark 冒泡排序
- (void)gly_bubbleSort:(NSString *)propertyName result:(NSComparisonResult)result
{
    if (self.count <= 1)
    {
        return;
    }
    
    for (NSInteger i = 0; i < self.count; i++)
    {
        //提前退出冒泡循环的标志位
        BOOL flag = NO;
        for (NSInteger j = 0; j < self.count - i - 1; j++)
        {
            NSNumber *numberOne = [self[j] valueForKey:propertyName];
            NSNumber *numberTwo = [self[j + 1] valueForKey:propertyName];
            if ([numberOne compare:numberTwo] == result)
            {
                flag = YES;
                [self exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
            }
        }
        
        if (!flag)
        {
            break;
        }
    }
}

#pragma mark -
#pragma mark 插入排序
- (void)gly_insertionSort:(NSString *)propertyName result:(NSComparisonResult)result
{
    for (NSInteger i = 1; i < self.count; i++)
    {
        id aimObj = self[i];
        NSNumber *aimNumber = [aimObj valueForKey:propertyName];
        NSInteger j = i - 1;
        
        for (; j >= 0; j--)
        {
            id obj = self[j];
            NSNumber *number = [obj valueForKey:propertyName];;
            if ([number compare:aimNumber] == result)
            {
                [self replaceObjectAtIndex:j + 1 withObject:self[j]];
            }
            else
            {
                break;
            }
        }
        self[j + 1] = aimObj;
    }
}

#pragma mark -
#pragma mark 选择排序
- (void)gly_selectionSort:(NSString *)propertyName result:(NSComparisonResult)result
{
    for (NSInteger i = 0; i < self.count; i++)
    {
        NSInteger j = i;
        
        NSNumber *minNumber = [self[j] valueForKey:propertyName];
        NSInteger index = j;
        
        for (; j < self.count; j++)
        {
            NSNumber *tempNumber = [self[j] valueForKey:propertyName];
            if ([minNumber compare:tempNumber] == result)
            {
                minNumber = [self[j] valueForKey:propertyName];
                index = j;
            }
        }
        
        if (index != i)
        {
            [self exchangeObjectAtIndex:index withObjectAtIndex:i];
        }
    }
}

#pragma mark -
#pragma mark 希尔排序
- (void)gly_shellSort:(NSString *)propertyName result:(NSComparisonResult)result
{
    NSInteger gap = (NSInteger)self.count / 2;
    while (gap >= 1)
    {
        for (NSInteger i = gap ; i < self.count; i++)
        {
            id tempObj = self[i];
            NSNumber *tempNumber = [tempObj valueForKey:propertyName];
            NSInteger j = i;
            
            while (j >= gap && [[self[j - gap] valueForKey:propertyName] compare:tempNumber] == result)
            {
                [self replaceObjectAtIndex:j withObject:[self objectAtIndex:j - gap]];
                j -= gap;
            }
            
            [self replaceObjectAtIndex:j withObject:tempObj];
        }
        
        gap = gap / 2;
    }
}

#pragma mark -
#pragma mark 归并排序
- (void)gly_mergeSort:(NSString *)propertyName result:(NSComparisonResult)result
{
    [self gly_mergeSortPropertyName:propertyName result:result p:0 r:self.count - 1];
}

- (void)gly_mergeSortPropertyName:(NSString *)propertyName result:(NSComparisonResult)result p:(NSInteger)p r:(NSInteger)r
{
    if (p >= r)
    {
        return;
    }
    
    NSInteger q = (p + r) / 2;
    
    [self gly_mergeSortPropertyName:propertyName result:result p:p r:q];
    [self gly_mergeSortPropertyName:propertyName result:result p:q + 1 r:r];
    
    [self gly_mergePropertyName:propertyName result:result p:p r:r];
}

- (void)gly_mergePropertyName:(NSString *)propertyName result:(NSComparisonResult)result  p:(NSInteger)p r:(NSInteger)r
{
    NSInteger q = (p + r) / 2;
    
    NSInteger i = p;
    NSInteger j = q + 1;
    NSInteger k = 0;
    
    NSMutableArray *tempArray = [NSMutableArray array];
    
    while (i <= q && j <= r)
    {
        NSNumber *numberOne = [self[i] valueForKey:propertyName];
        NSNumber *numberTwo = [self[j] valueForKey:propertyName];
        if ([numberOne compare:numberTwo] == result)
        {
            [tempArray insertObject:self[j++] atIndex:k++];
        }
        else
        {
            [tempArray insertObject:self[i++] atIndex:k++];
        }
    }
    
    NSInteger start = i;
    NSInteger end = q;
    if (j <= r)
    {
        start = j;
        end = r;
    }
    
    while (start <= end)
    {
        [tempArray insertObject:self[start++] atIndex:k++];
    }
    
    [self replaceObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(p, r - p + 1)] withObjects:tempArray];
}

#pragma mark -
#pragma mark 快速排序
- (void)gly_quickSort:(NSString *)propertyName result:(NSComparisonResult)result
{
    [self gly_quickSortPropertyName:propertyName result:result p:0 r:self.count - 1];
}

- (void)gly_quickSortPropertyName:(NSString *)propertyName result:(NSComparisonResult)result p:(NSInteger)p r:(NSInteger)r
{
    if (p >= r)
    {
        return;
    }
    
    NSInteger q = [self gly_partitionPropertyName:propertyName result:result p:p r:r];

    [self gly_quickSortPropertyName:propertyName result:result p:p r:q - 1];
    [self gly_quickSortPropertyName:propertyName result:result p:q + 1 r:r];
}

- (NSInteger)gly_partitionPropertyName:(NSString *)propertyName result:(NSComparisonResult)result p:(NSInteger)p r:(NSInteger)r
{
    NSNumber *pivot = [self[r] valueForKey:propertyName];
    NSInteger i = p;
    
    for (NSInteger j = p; j < r; j++)
    {
        NSNumber *tempNumber = [self[j] valueForKey:propertyName];
        if ([pivot compare:tempNumber] == result)
        {
            [self exchangeObjectAtIndex:i withObjectAtIndex:j];
            i++;
        }
    }
    
    [self exchangeObjectAtIndex:i withObjectAtIndex:r];
    
    return i;
}

@end
