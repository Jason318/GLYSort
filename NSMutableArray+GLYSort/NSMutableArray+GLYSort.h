//
//  NSMutableArray+GLYSort.h
//  RecursionDemo
//
//  Created by Jason on 2018/12/19.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (GLYSort)

/**
 * 冒泡排序
 *
 * 是否基于比较：是
 * 是否稳定排序：是
 * 是否原地操作：是
 * 时间复杂度为O(n2)，比较高，适合小规模数据的排序。
 * 适合排序数据类型：NSString,NSNumber,CGFloat,NSInteger,long
 **/
- (void)gly_bubbleSort:(NSString *)propertyName result:(NSComparisonResult)result;


/**
 * 插入排序
 *
 * 是否基于比较：是
 * 是否稳定排序：是
 * 是否原地操作：是
 * 时间复杂度为O(n2)，比较高，适合小规模数据的排序。
 * 适合排序数据类型：NSString,NSNumber,CGFloat,NSInteger,long
 **/
- (void)gly_insertionSort:(NSString *)propertyName result:(NSComparisonResult)result;


/**
 * 选择排序
 *
 * 是否基于比较：是
 * 是否稳定排序：否
 * 是否原地操作：是
 * 时间复杂度为O(n2)，比较高，适合小规模数据的排序。
 * 适合排序数据类型：NSString,NSNumber,CGFloat,NSInteger,long
 **/
- (void)gly_selectionSort:(NSString *)propertyName result:(NSComparisonResult)result;


/**
 * 希尔排序
 *
 * 是否基于比较：是
 * 是否稳定排序：是
 * 是否原地操作：是
 * 时间复杂度为O(n(1.3—2))，因此中等大小规模表现良好。
 * 适合排序数据类型：NSString,NSNumber,CGFloat,NSInteger,long
 **/
- (void)gly_shellSort:(NSString *)propertyName result:(NSComparisonResult)result;


/**
 * 归并排序
 *
 * 是否基于比较：是
 * 是否稳定排序：是
 * 是否原地操作：否
 * 时间复杂度为O(nlogn)，因此大规模表现良好。
 * 适合排序数据类型：NSString,NSNumber,CGFloat,NSInteger,long
 **/
- (void)gly_mergeSort:(NSString *)propertyName result:(NSComparisonResult)result;


/**
 * 快速排序
 *
 * 是否基于比较：是
 * 是否稳定排序：否
 * 是否原地操作：是
 * 时间复杂度为O(nlogn)，因此大规模表现良好。
 * 适合排序数据类型：NSString,NSNumber,CGFloat,NSInteger,long
 **/
- (void)gly_quickSort:(NSString *)propertyName result:(NSComparisonResult)result;


/**
 * 桶排序
 *
 * 是否基于比较：否（线性排序）
 * 是否稳定排序：是
 * 是否原地操作：否
 * 时间复杂度为更低的O(n)，但是对要排序的数据要求很苛刻，主要针对范围不大的数据，将数据划分成不同的桶来实现排序。
 * 适合排序数据类型：NSString,NSNumber,CGFloat,NSInteger,long
 **/
- (void)gly_bucketSort:(NSString *)propertyName result:(NSComparisonResult)result;


/**
 * 计数排序
 *
 * 是否基于比较：否（线性排序）
 * 是否稳定排序：是
 * 是否原地操作：否
 * 时间复杂度为更低的O(n)，但是对要排序的数据要求很苛刻，主要针对范围不大的数据，将数据划分成不同的桶来实现排序。
 * 适合排序数据类型：NSString,NSNumber,NSInteger,long
 **/
- (void)gly_countingSort:(NSString *)propertyName result:(NSComparisonResult)result;


/**
 * 基数排序
 * 
 * 是否基于比较：否（线性排序）
 * 是否稳定排序：是
 * 是否原地操作：否
 * 时间复杂度为更低的O(n)，但是对要排序的数据要求很苛刻，基数排序要求数据可以划分成高低位，位之间有递进关系。比较两个数，我们只需要比较高位，高位相同的再比较低位。而且每一-位的数据范围不能太大。
 * 适合排序数据类型：NSString,NSNumber,NSInteger,long
 **/
- (void)gly_radixSort:(NSString *)propertyName result:(NSComparisonResult)result;

@end
