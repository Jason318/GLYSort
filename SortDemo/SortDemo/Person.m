//
//  Person.m
//  RecursionDemo
//
//  Created by Jason on 2018/12/19.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)description
{
    return [NSString stringWithFormat:@"age:%ld,record:%@,money:%@,room:%ld,mobile:%ld,height:%f",(long)self.age,self.record,self.money,(long)self.room,self.mobile,self.height];
}

@end
