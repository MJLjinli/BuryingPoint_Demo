//
//  UIViewController+UserStatistics.m
//  BuryingPoint_Demo
//
//  Created by 马金丽 on 17/7/10.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import "UIViewController+UserStatistics.h"
#import "MJLHookManager.h"
@implementation UIViewController (UserStatistics)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //页面进入
        SEL originalSelectorAppear = @selector(viewWillAppear:);
        SEL swizzledSelectorAppear = @selector(swizz_viewWillAppear:);
        [MJLHookManager swizzlingInClass:[self class] originalSelector:originalSelectorAppear swizzledSelector:swizzledSelectorAppear];
        
        SEL originalSelectorDisappear = @selector(viewWillDisappear:);
        SEL swizzledSelectorDisappear = @selector(swizz_viewWillDisappear:);
        [MJLHookManager swizzlingInClass:[self class] originalSelector:originalSelectorDisappear swizzledSelector:swizzledSelectorDisappear];
        
    });
}

- (void)swizz_viewWillAppear:(BOOL)animated
{
    [self swizz_viewWillAppear:YES];
    NSLog(@"页面进入%@",NSStringFromClass([self class]));
}


- (void)swizz_viewWillDisappear:(BOOL)animated
{
    [self swizz_viewWillDisappear:YES];
    NSLog(@"页面消失%@",NSStringFromClass([self class]));
}
@end
