# GLYSort
### 冒泡排序，插入排序，选择排序，希尔排序，归并排序，快速排序，二分查找

## 导入：

#### 1.通过Cocoapods安装:

pod 'GLYSort', '~> 0.0.4'

#### 2.直接把GLYSort文件夹拖入项目

## 使用：

使用很简单，只需一行代码即可完成复杂排序。


```
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

    //二分查找
    NSInteger index = [datasource gly_bsearchLessWithLoop:@"height" value:207.6f];
    NSLog(@"index....%ld",(long)index);
    
    NSLog(@"datasource....%@",datasource);
 
```
