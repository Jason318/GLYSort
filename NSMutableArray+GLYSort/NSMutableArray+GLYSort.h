//
//  NSMutableArray+GLYSort.h
//  RecursionDemo
//
//  Created by Jason on 2018/12/19.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (GLYSort)

// 冒泡排序
- (void)gly_bubbleSort:(NSString *)propertyName result:(NSComparisonResult)result;

// 插入排序
- (void)gly_insertionSort:(NSString *)propertyName result:(NSComparisonResult)result;

// 选择排序
- (void)gly_selectionSort:(NSString *)propertyName result:(NSComparisonResult)result;

// 希尔排序
- (void)gly_shellSort:(NSString *)propertyName result:(NSComparisonResult)result;

// 归并排序
- (void)gly_mergeSort:(NSString *)propertyName result:(NSComparisonResult)result;

// 快速排序
- (void)gly_quickSort:(NSString *)propertyName result:(NSComparisonResult)result;

@end
