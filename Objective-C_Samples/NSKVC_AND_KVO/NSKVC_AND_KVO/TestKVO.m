//
//  TestKVO.m
//  NSKVC_AND_KVO
//
//  Created by gao han on 2017/2/17.
//  Copyright © 2017年 Gaohan. All rights reserved.
//

#import "TestKVO.h"
#import "GHPerson.h"
#import "GHPersonManual.h"

static char * CONTEXT_KVO_AGE_CHANGE = "KVO_AGE_CHANGED";
static char * CONTEXT_KVO_AGE_CHANGE_MANUAL = "KVO_AGE_CHANGED_MANUAL";

@interface TestKVO()
@property(nonatomic, strong) NSMutableArray * persons;
@property(nonatomic, strong) NSMutableArray * Mperson;
@end

@implementation TestKVO
@synthesize persons = _persons;

-(instancetype)init
{
    self = [super init];
    if (self) {
        _persons = [[NSMutableArray alloc] init];
        _Mperson = [[NSMutableArray alloc] init];
    }
    
    return self;
}

// 测试自动发送
-(void)TestAuto
{
    GHPerson * person;
    for (int i=0; i<5; i++) {
        person = [[GHPerson alloc] init];
        person.Age = i;
        person.UserName = [NSString stringWithFormat:@"Gao Han_%d", i];
        [person addObserver:self forKeyPath:@"Age" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:CONTEXT_KVO_AGE_CHANGE];
        
        [self.persons addObject:person];
    }
    
    // 开始修改age，以触发回调函数
    for(id obj in _persons)
    {
        [obj setValue:@10 forKey:@"Age"];
    }
    
}

-(void)TestManual{

    GHPersonManual * person = [[GHPersonManual alloc]init];
    //[person setValue:@"Gao Han" forKey:@"MUserNamel"];
    //[person setValue:@20 forKey:@"MAge"];
    person.MAge = 20;
    person.MUserNamel = @"MGao Han";
    
    [person addObserver:self forKeyPath:@"MAge" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:CONTEXT_KVO_AGE_CHANGE_MANUAL];
    
    
    [person setNewAge:88];
    [self.Mperson addObject:person];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (context == CONTEXT_KVO_AGE_CHANGE) {
        NSNumber * newAge = [change objectForKey:NSKeyValueChangeNewKey];
        NSNumber * oldAge = [change objectForKey:NSKeyValueChangeOldKey];
        NSLog(@"name:%@,old age:%@,new age: %@", [object valueForKey:@"UserName"], oldAge, newAge);
    }else if(context == CONTEXT_KVO_AGE_CHANGE_MANUAL){
        NSLog(@"手动年龄更改了");
    }
}

-(void)dealloc
{
    NSLog(@"TestKVO dealloc");
    for (id obj in self.persons) {
        [obj removeObserver:self forKeyPath:@"Age"];
    }
    
    [self.persons removeAllObjects];
    
    for (id obj in self.Mperson) {
        [obj removeObserver:self forKeyPath:@"MAge"];
    }
    
    [self.Mperson removeAllObjects];
}
@end
