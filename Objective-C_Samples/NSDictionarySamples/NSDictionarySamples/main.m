//
//  main.m
//  NSDictionarySamples
//
//  Created by gao han on 2017/2/17.
//  Copyright © 2017年 Gaohan. All rights reserved.
//

#import <Foundation/Foundation.h>
#define KEY_SIZE 10
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        //NSDictionary 插入数据，数据在字典中是一一对应
        NSString * pKeys[KEY_SIZE];
        NSString * pValues[KEY_SIZE];
        for (int i=0; i<KEY_SIZE; i++) {
            pKeys[i] = [NSString stringWithFormat:@"Key_%d", i];
            pValues[i] = [NSString stringWithFormat:@"Value_%d", i];
        }
        
        NSArray * pArrayKeys = [NSArray arrayWithObjects:pKeys count:KEY_SIZE];
        NSArray * pArrayValues = [NSArray arrayWithObjects:pValues count:KEY_SIZE];
        
        for(id obj in pArrayKeys){
            NSLog(@"key:%@", obj);
        }
        
        NSDictionary * dic1 = [[NSDictionary alloc ] initWithObjects:pArrayValues forKeys:pArrayKeys];
        for (id obj in dic1) {
            NSLog(@"value:%@",[dic1 objectForKey:obj]);
        }
        
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        // NSDictionary 插入数据，数据在字典中，一对多个数据（例如一个省对应多个城市）
        NSArray * arrJiangsuCities = [[NSArray alloc]initWithObjects:@"南京",@"无锡",@"苏州",@"常州",@"镇江",@"扬州",@"泰州",@"南通",@"盐城",@"淮安",@"连云港",@"徐州",@"宿迁", nil];
        NSArray * arrZhejiangCities = [[NSArray alloc]initWithObjects:@"杭州",@"嘉兴",@"绍兴",@"丽水",@"舟山",@"温州",@"金华",@"台州",@"宁波",@"湖州",@"衢州", nil];
        NSString * jiangSu = @"江苏";
        NSString * zheJiang = @"浙江";
        NSDictionary * dictProvinces = [[NSDictionary alloc] initWithObjectsAndKeys:arrJiangsuCities,jiangSu, arrZhejiangCities,zheJiang, nil];
        
        for (id obj in dictProvinces) {
            NSLog(@"省份：%@", obj);
            for (id obj1 in [dictProvinces objectForKey:obj]) {
                NSLog(@"%@", obj1 );
            }
            
        }
        
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        // NSDictionary最简单的插入方式
        NSDictionary * dictSimple = [[NSDictionary alloc] initWithObjectsAndKeys:@"ffff",@"key1",@"1111",@"key2", nil];
        for (id obj in dictSimple) {
            NSLog(@"key:%@, value:%@", obj,[dictSimple objectForKey:obj]);
        }
        
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        // 用另外一个NSDictionary来初始化当前NSDictionary
        NSDictionary *anotherDicionary = [[NSDictionary alloc] initWithDictionary:dictSimple];
        for (id obj in anotherDicionary) {
            NSLog(@"key:%@, value:%@", obj,[anotherDicionary objectForKey:obj]);
        }
        
    }
    return 0;
}
