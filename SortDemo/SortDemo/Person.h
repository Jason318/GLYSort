//
//  Person.h
//  RecursionDemo
//
//  Created by Jason on 2018/12/19.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface Person : NSObject

@property (nonatomic ,strong) NSString  *name;
@property (nonatomic ,assign) NSInteger age;
@property (nonatomic ,strong) NSString  *record;
@property (nonatomic ,strong) NSNumber  *money;
@property (nonatomic ,assign) long      mobile;
@property (nonatomic ,assign) NSInteger room;
@property (nonatomic ,assign) CGFloat   height;

@end
