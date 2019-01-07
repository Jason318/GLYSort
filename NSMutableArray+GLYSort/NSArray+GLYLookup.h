//
//  NSArray+GLYLookup.h
//  SortDemo
//
//  Created by Jason on 2019/1/7.
//  Copyright © 2019年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (GLYLookup)

/**
 * 二分查找（循环）
 **/
- (NSInteger)gly_bsearchWithLoop:(NSInteger)value;

/**
 * 二分查找第一个给定值（循环）
 **/
- (NSInteger)gly_bsearchFirstItemWithLoop:(NSInteger)value;

/**
 * 二分查找最后一个给定值（循环）
 **/
- (NSInteger)gly_bsearchLastItemWithLoop:(NSInteger)value;

/**
 * 二分查找第一个大于等于给定值（循环）
 **/
- (NSInteger)gly_bsearchMoreWithLoop:(NSInteger)value;

/**
 * 二分查找最后一个小于等于给定值的元素（循环）
 **/
- (NSInteger)gly_bsearchLessWithLoop:(NSInteger)value;

/**
 * 二分查找（递归）
 **/
- (NSInteger)gly_bsearchWithRecursion:(NSInteger)value;

@end
