//
//  ViewController.m
//  SortDemo
//
//  Created by Jason on 2018/12/20.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableArray+GLYSort.h"
#import "NSArray+GLYLookup.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *datasource = [NSMutableArray arrayWithObjects:@(1),@(3),@(5),@(9),@(9),@(9),@(9),@(9),@(17),@(19), nil];
    
//    Person *personOne = [[Person alloc] init];
//    personOne.name = @"Jason";
//    personOne.age = 98;
//    personOne.record = @"50";
//    personOne.money = @(100);
//    personOne.room = 3;
//    personOne.mobile = 18339316192;
//    personOne.height = 178.1f;
//    [datasource addObject:personOne];
//
//    Person *personTwo = [[Person alloc] init];
//    personTwo.name = @"Lucy";
//    personTwo.age = 96;
//    personTwo.record = @"60";
//    personTwo.money = @(300);
//    personTwo.room = 2;
//    personTwo.mobile = 18910411990;
//    personTwo.height = 180.6f;
//    [datasource addObject:personTwo];
//
//    Person *personThree = [[Person alloc] init];
//    personThree.name = @"Eson";
//    personThree.age = 97;
//    personThree.record = @"100";
//    personThree.money = @(200);
//    personThree.room = 5;
//    personThree.mobile = 15201362545;
//    personThree.height = 188.8f;
//    [datasource addObject:personThree];
//
//    Person *personFour = [[Person alloc] init];
//    personFour.name = @"Emily";
//    personFour.age = 94;
//    personFour.record = @"70";
//    personFour.money = @(600);
//    personFour.room = 1;
//    personFour.mobile = 18511488608;
//    personFour.height = 195.5f;
//    [datasource addObject:personFour];
//
//    Person *personFive = [[Person alloc] init];
//    personFive.name = @"JJ";
//    personFive.age = 95;
//    personFive.record = @"8";
//    personFive.money = @(500);
//    personFive.room = 4;
//    personFive.mobile = 15518559660;
//    personFive.height = 188.6f;
//    [datasource addObject:personFive];
    
//    NSLog(@"datasource....%@",datasource);

//    [datasource gly_quickSort:@"age" result:NSOrderedAscending];
//    [datasource gly_quickSort:@"record" result:NSOrderedDescending];
//    [datasource gly_quickSort:@"money" result:NSOrderedAscending];
//    [datasource gly_radixSort:@"height" result:NSOrderedDescending];
    
    NSInteger index = [datasource gly_bsearchLessWithLoop:10];
    NSLog(@"index....%ld",(long)index);

//    NSLog(@"datasource....%@",datasource);
}


@end
