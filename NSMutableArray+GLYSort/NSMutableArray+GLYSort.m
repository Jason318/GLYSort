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
            double numberOne = [[self[j] valueForKey:propertyName] doubleValue];
            double numberTwo = [[self[j + 1] valueForKey:propertyName] doubleValue];
            BOOL condition = result == NSOrderedDescending ? numberOne > numberTwo : numberOne < numberTwo;
            if (condition)
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
        double aimNumber = [[aimObj valueForKey:propertyName] doubleValue];
        NSInteger j = i - 1;
        
        for (; j >= 0; j--)
        {
            id obj = self[j];
            double number = [[obj valueForKey:propertyName] doubleValue];
            BOOL condition = result == NSOrderedDescending ? number > aimNumber : number < aimNumber;
            if (condition)
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
        
        double minNumber = [[self[j] valueForKey:propertyName] doubleValue];
        NSInteger index = j;
        
        for (; j < self.count; j++)
        {
            double tempNumber = [[self[j] valueForKey:propertyName] doubleValue];
            BOOL condition = result == NSOrderedDescending ? minNumber > tempNumber : minNumber < tempNumber;
            if (condition)
            {
                minNumber = [[self[j] valueForKey:propertyName] doubleValue];
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
            double tempNumber = [[tempObj valueForKey:propertyName] doubleValue];
            NSInteger j = i;

            if (result == NSOrderedDescending)
            {
                while (j >= gap && [[self[j - gap] valueForKey:propertyName] doubleValue] > tempNumber)
                {
                    [self replaceObjectAtIndex:j withObject:[self objectAtIndex:j - gap]];
                    j -= gap;
                }
            }
            else
            {
                while (j >= gap && [[self[j - gap] valueForKey:propertyName] doubleValue] < tempNumber)
                {
                    [self replaceObjectAtIndex:j withObject:[self objectAtIndex:j - gap]];
                    j -= gap;
                }
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
        double numberOne = [[self[i] valueForKey:propertyName] doubleValue];
        double numberTwo = [[self[j] valueForKey:propertyName] doubleValue];
        BOOL condition = result == NSOrderedDescending ? numberOne > numberTwo : numberOne < numberTwo;
        if (condition)
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
    double pivot = [[self[r] valueForKey:propertyName] doubleValue];
    NSInteger i = p;
    
    for (NSInteger j = p; j < r; j++)
    {
        double tempNumber = [[self[j] valueForKey:propertyName] doubleValue];
        BOOL condition = result == NSOrderedDescending ? pivot > tempNumber : pivot < tempNumber;
        if (condition)
        {
            [self exchangeObjectAtIndex:i withObjectAtIndex:j];
            i++;
        }
    }
    
    [self exchangeObjectAtIndex:i withObjectAtIndex:r];
    
    return i;
}

#pragma mark -
#pragma mark 桶排序
- (void)gly_bucketSort:(NSString *)propertyName result:(NSComparisonResult)result
{
    //预计每个桶内能装3个
    NSInteger size = 3;
    
    //桶的数量
    NSInteger bucketsCount = self.count / size;
    
    //找出最小值和最大值
    double min = [[self[0] valueForKey:propertyName] doubleValue];
    double max = [[self[0] valueForKey:propertyName] doubleValue];
    
    for (id obj in self)
    {
        double number = [[obj valueForKey:propertyName] doubleValue];
        if (number < min)
        {
            min = number;
        }
        
        if (number > max)
        {
            max = number;
        }
    }
    
    //平均值
    NSInteger average = ceil((max - min)/(double)bucketsCount);
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    //创建空桶
    for (NSInteger i = 0; i <= bucketsCount; i++)
    {
        NSMutableArray *bucketArray = [NSMutableArray array];
        NSString *key = [NSString stringWithFormat:@"%@-%@",@(min + i * average),@(min + (i + 1) * average)];
        [dictionary setValue:bucketArray forKey:key];
    }
    
    for (id obj in self)
    {
        double number = [[obj valueForKey:propertyName] doubleValue];
        NSInteger i = floor((number - min) / (double)average);
        NSString *key = [NSString stringWithFormat:@"%@-%@",@(min + i * average),@(min + (i + 1) * average)];
        NSMutableArray *bucketArray = [dictionary valueForKey:key];
        [bucketArray addObject:obj];
    }
    
    NSInteger length = 0;
    for (NSInteger i = 0; i < dictionary.allKeys.count; i++)
    {
        NSString *key = [NSString stringWithFormat:@"%@-%@",@(min + i * average),@(min + (i + 1) * average)];
        NSMutableArray *bucketArray = [dictionary objectForKey:key];
        [bucketArray gly_quickSort:propertyName result:result];
        if (result == NSOrderedDescending)
        {
            [self replaceObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(length, bucketArray.count)] withObjects:bucketArray];
        }
        else
        {
            NSInteger start = self.count - length - bucketArray.count;
            [self replaceObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(start, bucketArray.count)] withObjects:bucketArray];
        }
        length += bucketArray.count;
    }
}

#pragma mark -
#pragma mark 计数排序
- (void)gly_countingSort:(NSString *)propertyName result:(NSComparisonResult)result
{
    if (self.count <= 1)
    {
        return;
    }
    
    NSInteger max = [[self[0] valueForKey:propertyName] integerValue];
    
    for (id obj in self)
    {
        NSNumber *number = [obj valueForKey:propertyName];
        if (number.integerValue > max)
        {
            max = number.integerValue;
        }
    }
    
    NSMutableArray *countArray = [NSMutableArray array];
    
    for (NSInteger i = 0; i <= max; i++)
    {
        [countArray addObject:@(0)];
    }
    
    NSMutableArray *resultArray = [NSMutableArray array];
    
    for (NSInteger i = 0; i < self.count; i++)
    {
        [resultArray addObject:@(0)];
        
        NSNumber *index = [self[i] valueForKey:propertyName];
        NSNumber *count = countArray[index.integerValue];
        [countArray replaceObjectAtIndex:index.integerValue withObject:@(count.integerValue + 1)];
    }
    
    for (NSInteger i = 1; i <= max; i++)
    {
        [countArray replaceObjectAtIndex:i withObject:@([countArray[i] integerValue] + [countArray[i - 1] integerValue])];
    }
    
    for (NSInteger i = self.count - 1; i >= 0; i--)
    {
        NSNumber *index = [self[i] valueForKey:propertyName];
        NSInteger count = [countArray[index.integerValue] integerValue] - 1;
        
        NSInteger location = result == NSOrderedDescending ? count : self.count - 1 - count;
        
        [resultArray replaceObjectAtIndex:location withObject:self[i]];
        [countArray replaceObjectAtIndex:index.integerValue withObject:@(count)];
    }
    
    for (NSInteger i = 0; i < self.count; i++)
    {
        [self replaceObjectAtIndex:i withObject:resultArray[i]];
    }
}

#pragma mark -
#pragma mark 基数排序
- (void)gly_radixSort:(NSString *)propertyName result:(NSComparisonResult)result
{
    NSMutableArray *bucket = [self createBucket];
    long maxNumber = [self listMaxItem:propertyName];
    NSInteger maxLength = [self numberLength:maxNumber];
    
    for (NSInteger digit = 1; digit <= maxLength; digit++)
    {
        //入桶
        for (id obj in self)
        {
            NSNumber *number = [obj valueForKey:propertyName];
            NSInteger baseNumber = [self fetchBaseNumber:number.integerValue digit:digit];
            NSMutableArray *subArray = bucket[baseNumber];
            [subArray addObject:obj];
        }
        
        //出桶
        NSInteger index = 0;
        
        NSInteger i = result == NSOrderedDescending ? 0 : bucket.count - 1;
        for (;result == NSOrderedDescending ? (i < bucket.count) : (i >= 0); result == NSOrderedDescending ? i++ : i--)
        {
            NSMutableArray *subArray = bucket[i];
            while (subArray.count > 0)
            {
                id obj = subArray[0];
                [self replaceObjectAtIndex:index withObject:obj];
                [subArray removeObjectAtIndex:0];
                index++;
            }
        }
    }
}

//创建10个空桶
- (NSMutableArray *)createBucket
{
    NSMutableArray *bucketArray = [NSMutableArray array];
    
    for (NSInteger i = 0; i < 10; i++)
    {
        [bucketArray addObject:[NSMutableArray array]];
    }
    
    return bucketArray;
}

//计算无序序列中最大或最小的数值
- (long)listMaxItem:(NSString *)propertyName
{
    NSInteger max = [[self[0] valueForKey:propertyName] integerValue];
    
    for (NSInteger i = 1; i < self.count; i++)
    {
        id obj = self[i];
        NSInteger number = [[obj valueForKey:propertyName] integerValue];
        if (max < number)
        {
            max = number;
        }
    }
    
    return max;
}

//获取数字的长度
- (NSInteger)numberLength:(NSInteger)number
{
    NSString *numberStr = [NSString stringWithFormat:@"%ld",(long)number];
    
    return numberStr.length;
}

//获取数值中特定位数的值
- (NSInteger)fetchBaseNumber:(NSInteger)number digit:(NSInteger)digit
{
    if (digit > 0 && digit <= [self numberLength:number])
    {
        NSMutableArray *numbersArray = [NSMutableArray array];
        
        NSString *numberStr = [NSString stringWithFormat:@"%ld",(long)number];
        
        for (NSInteger i = 0; i < numberStr.length; i++)
        {
            NSString *subStr = [numberStr substringWithRange:NSMakeRange(i, 1)];
            [numbersArray addObject:[NSNumber numberWithInteger:subStr.integerValue]];
        }
        
        return [numbersArray[numbersArray.count - digit] integerValue];
    }
    
    return 0;
}

@end
