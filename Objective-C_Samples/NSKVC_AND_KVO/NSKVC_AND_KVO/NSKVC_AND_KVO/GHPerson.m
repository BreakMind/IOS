//
//  GHPerson.m
//  NSKVC_AND_KVO
//
//  Created by gao han on 2017/2/17.
//  Copyright © 2017年 Gaohan. All rights reserved.
//

#import "GHPerson.h"

@interface GHPerson()
// 伴侣
@property(nonatomic, weak) GHPerson * partner;
@end

@implementation GHPerson

-(void)dealloc
{
    NSLog(@"GHPerson Dealloc");
}
@end
