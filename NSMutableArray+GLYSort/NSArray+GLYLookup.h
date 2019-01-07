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
 
 * 二分查找的时间复杂度很低，为O(logn)，所以查找速度惊人，效率非常高。
 **/
- (NSInteger)gly_bsearchWithLoop:(NSString *)propertyName value:(double)value;

/**
 * 二分查找（递归）
 **/
- (NSInteger)gly_bsearchWithRecursion:(NSString *)propertyName value:(double)value;


/**
 * 凡是用二分查找能解决的，绝大部分我们更倾向于用散列表或者二叉查找树。即便是二分查找在内存使用上更节省，但是毕竟内存如此紧缺的情况并不多。那二分查找真的没什么用处了吗？
 *
 * 像上面这种“值等于给定值”的二分查找确实不怎么会被用到，二分查找更适合用在“近似”查找问题，在这类问题上，二分查找的优势更加明显。比如下面这几种变体问题，用其他数据结构，
 * 比如散列表、二叉树，就比较难实现了。
 *
 * 变体的二分查找算法写起来非常烧脑，很容易因为细节处理不好而产生Bug，这些容易出错的细节有:终止条件、区间.上下界更新方法、返回值选择。
 **/


/**
 * 二分查找第一个给定值（循环）
 **/
- (NSInteger)gly_bsearchFirstItemWithLoop:(NSString *)propertyName value:(double)value;

/**
 * 二分查找最后一个给定值（循环）
 **/
- (NSInteger)gly_bsearchLastItemWithLoop:(NSString *)propertyName value:(double)value;

/**
 * 二分查找第一个大于等于给定值（循环）
 **/
- (NSInteger)gly_bsearchMoreWithLoop:(NSString *)propertyName value:(double)value;

/**
 * 二分查找最后一个小于等于给定值的元素（循环）
 **/
- (NSInteger)gly_bsearchLessWithLoop:(NSString *)propertyName value:(double)value;

@end
