//
//  GHPersonManual.m
//  NSKVC_AND_KVO
//
//  Created by gao han on 2017/2/18.
//  Copyright © 2017年 Gaohan. All rights reserved.
//

#import "GHPersonManual.h"

@interface GHPersonManual()
@property(nonatomic, weak) GHPersonManual * MPerson;
@end

@implementation GHPersonManual

-(void)setNewAge:(NSUInteger)age
{
    [self willChangeValueForKey:@"MAge"];
    self.MAge = age;
    [self didChangeValueForKey:@"MAge"];
}

+(BOOL)automaticallyNotifiesObserversForKey:(NSString *)key{
    [super automaticallyNotifiesObserversForKey:key];
    
    // 返回NO，设置为不自动发送通知
    return NO;
}
@end
