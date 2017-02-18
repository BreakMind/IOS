//
//  main.m
//  NSKVC_AND_KVO
//
//  Created by gao han on 2017/2/17.
//  Copyright © 2017年 Gaohan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GHPerson.h"
#import "TestKVO.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
        GHPerson * gaohan = [[GHPerson alloc]init];
        
        [gaohan setValue:@"Gao Han" forKey:@"UserName"];
        [gaohan setValue:@32 forKey:@"Age"];
        
        NSLog(@"name:%@, age:%@", [gaohan valueForKey:@"UserName"],[gaohan valueForKey:@"Age"]);
         */
        
        TestKVO * t =[[TestKVO alloc] init];
        //[t TestAuto];
        
        [t TestManual];
    }
    return 0;
}
