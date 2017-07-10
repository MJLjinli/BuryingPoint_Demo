//
//  UIControl+UserStatistics.m
//  BuryingPoint_Demo
//
//  Created by 马金丽 on 17/7/10.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import "UIControl+UserStatistics.h"
#import "MJLHookManager.h"
@implementation UIControl (UserStatistics)


+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSelector = @selector(sendAction:to:forEvent:);
        SEL swizzledSelector = @selector(swizz_sendAction:to:forEvent:);
        [MJLHookManager swizzlingInClass:[self class] originalSelector:originalSelector swizzledSelector:swizzledSelector];
    });
}


- (void)swizz_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    [self swizz_sendAction:action to:target forEvent:event];
    NSLog(@"统计点击事件%@",NSStringFromClass([self class]));
}

@end
