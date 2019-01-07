//
//  NSArray+GLYLookup.m
//  SortDemo
//
//  Created by Jason on 2019/1/7.
//  Copyright © 2019年 Jason. All rights reserved.
//

#import "NSArray+GLYLookup.h"

@implementation NSArray (GLYLookup)

#pragma mark -
#pragma mark 二分查找（循环）
- (NSInteger)gly_bsearchWithLoop:(NSString *)propertyName value:(double)value
{
    NSInteger low = 0;
    NSInteger high = self.count - 1;
    
    while (low <= high)
    {
        //为什么不写(low + high) / 2，是因为如果 low 和 high 比较大的话，两者之和就有可能会溢出。
        NSInteger mid = low + ((high - low) >> 1);
        double middleNumber = [[self[mid] valueForKey:propertyName] doubleValue];
        if ([@(middleNumber) compare:@(value)] == NSOrderedSame)
        {
            return mid;
        }
        else if ([@(middleNumber) compare:@(value)] == NSOrderedAscending)
        {
            low = mid + 1;
        }
        else
        {
            high = mid - 1;
        }
    }
    
    return -1;
}

#pragma mark -
#pragma mark 二分查找（递归）
- (NSInteger)gly_bsearchWithRecursion:(NSString *)propertyName value:(double)value
{
    return [self gly_bsearchInternally:propertyName value:value low:0 high:self.count - 1];
}

- (NSInteger)gly_bsearchInternally:(NSString *)propertyName value:(double)value low:(NSInteger)low high:(NSInteger)high
{
    if (low > high)
    {
        return -1;
    }
    
    //因为相比除法运算来说，计算机处理位运算要快得多。这里也等同于（NSInteger mid = low + (high - low) / 2）
    NSInteger mid = low + ((high - low) >> 1);
    double middleNumber = [[self[mid] valueForKey:propertyName] doubleValue];
    if ([@(middleNumber) compare:@(value)] == NSOrderedSame)
    {
        return mid;
    }
    else if ([@(middleNumber) compare:@(value)] == NSOrderedAscending)
    {
        return [self gly_bsearchInternally:propertyName value:value low:mid + 1 high:high];
    }
    else
    {
        return [self gly_bsearchInternally:propertyName value:value low:low high:mid - 1];
    }
}

#pragma mark -
#pragma mark 二分查找第一个给定值（循环）
- (NSInteger)gly_bsearchFirstItemWithLoop:(NSString *)propertyName value:(double)value
{
    NSInteger low = 0;
    NSInteger high = self.count - 1;
    
    while (low <= high)
    {
        //为什么不写(low + high) / 2，是因为如果 low 和 high 比较大的话，两者之和就有可能会溢出。
        NSInteger mid = low + ((high - low) >> 1);
        double middleNumber = [[self[mid] valueForKey:propertyName] doubleValue];
        if ([@(middleNumber) compare:@(value)] == NSOrderedDescending)
        {
            high = mid - 1;
        }
        else if ([@(middleNumber) compare:@(value)] == NSOrderedAscending)
        {
            low = mid + 1;
        }
        else
        {
            if (mid == 0 || [@([[self[mid - 1] valueForKey:propertyName] doubleValue]) compare:@(value)] != NSOrderedSame)
            {
                return mid;
            }
            else
            {
                high = mid - 1;
            }
        }
    }
    
    return -1;
}

#pragma mark -
#pragma mark 二分查找最后一个给定值（循环）
- (NSInteger)gly_bsearchLastItemWithLoop:(NSString *)propertyName value:(double)value
{
    NSInteger low = 0;
    NSInteger high = self.count - 1;
    
    while (low <= high)
    {
        //为什么不写(low + high) / 2，是因为如果 low 和 high 比较大的话，两者之和就有可能会溢出。
        NSInteger mid = low + ((high - low) >> 1);
        double middleNumber = [[self[mid] valueForKey:propertyName] doubleValue];
        if ([@(middleNumber) compare:@(value)] == NSOrderedDescending)
        {
            high = mid - 1;
        }
        else if ([@(middleNumber) compare:@(value)] == NSOrderedAscending)
        {
            low = mid + 1;
        }
        else
        {
            if (mid == self.count - 1 || [@([[self[mid + 1] valueForKey:propertyName] doubleValue]) compare:@(value)] != NSOrderedSame)
            {
                return mid;
            }
            else
            {
                low = mid + 1;
            }
        }
    }
    
    return -1;
}

#pragma mark -
#pragma mark 二分查找第一个大于等于给定值（循环）
- (NSInteger)gly_bsearchMoreWithLoop:(NSString *)propertyName value:(double)value
{
    NSInteger low = 0;
    NSInteger high = self.count - 1;
    
    while (low <= high)
    {
        NSInteger mid = low + ((high - low) >> 1);
        double middleNumber = [[self[mid] valueForKey:propertyName] doubleValue];
        if ([@(middleNumber) compare:@(value)] == NSOrderedAscending)
        {
            low = mid + 1;
        }
        else
        {
            if (mid == 0 || [@([[self[mid - 1] valueForKey:propertyName] doubleValue]) compare:@(value)] == NSOrderedAscending)
            {
                return mid;
            }
            else
            {
                high = mid - 1;
            }
        }
    }
    
    return -1;
}

#pragma mark -
#pragma mark 二分查找最后一个小于等于给定值的元素
- (NSInteger)gly_bsearchLessWithLoop:(NSString *)propertyName value:(double)value
{
    NSInteger low = 0;
    NSInteger high = self.count - 1;
    
    while (low <= high)
    {
        NSInteger mid = low + ((high - low) >> 1);
        double middleNumber = [[self[mid] valueForKey:propertyName] doubleValue];
        if ([@(middleNumber) compare:@(value)] == NSOrderedDescending)
        {
            high = mid - 1;
        }
        else
        {
            if (mid == self.count - 1 || [@([[self[mid + 1] valueForKey:propertyName] doubleValue]) compare:@(value)] == NSOrderedDescending)
            {
                return mid;
            }
            else
            {
                low = mid + 1;
            }
        }
    }
    
    return -1;
}

@end
