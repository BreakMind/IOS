//
//  GHPersonManual.h
//  NSKVC_AND_KVO
//
//  Created by gao han on 2017/2/18.
//  Copyright © 2017年 Gaohan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GHPersonManual : NSObject
@property(nonatomic, strong)NSString * MUserNamel;
@property(nonatomic, assign)NSUInteger MAge;

-(void)setNewAge:(NSUInteger)age;
@end
