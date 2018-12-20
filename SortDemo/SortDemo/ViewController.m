//
//  ViewController.m
//  SortDemo
//
//  Created by Jason on 2018/12/20.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableArray+GLYSort.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *datasource = [NSMutableArray array];
    
    Person *personOne = [[Person alloc] init];
    personOne.name = @"Jason";
    personOne.age = 28;
    personOne.record = @"99";
    personOne.money = @(1000000);
    [datasource addObject:personOne];
    
    Person *personTwo = [[Person alloc] init];
    personTwo.name = @"Lucy";
    personTwo.age = 18;
    personTwo.record = @"60";
    personTwo.money = @(3000000);
    [datasource addObject:personTwo];
    
    Person *personThree = [[Person alloc] init];
    personThree.name = @"Eson";
    personThree.age = 38;
    personThree.record = @"90";
    personThree.money = @(2000000);
    [datasource addObject:personThree];
    
    Person *personFour = [[Person alloc] init];
    personFour.name = @"Emily";
    personFour.age = 78;
    personFour.record = @"70";
    personFour.money = @(6000000);
    [datasource addObject:personFour];
    
    Person *personFive = [[Person alloc] init];
    personFive.name = @"JJ";
    personFive.age = 68;
    personFive.record = @"80";
    personFive.money = @(5000000);
    [datasource addObject:personFive];
    
    NSLog(@"datasource....%@",datasource);

//    [datasource gly_quickSort:@"age" result:NSOrderedAscending];
    [datasource gly_quickSort:@"record" result:NSOrderedDescending];
//    [datasource gly_quickSort:@"money" result:NSOrderedAscending];
    
    NSLog(@"datasource....%@",datasource);
}


@end
