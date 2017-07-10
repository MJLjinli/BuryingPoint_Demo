//
//  MJLHookManager.h
//  BuryingPoint_Demo
//
//  Created by 马金丽 on 17/7/10.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJLHookManager : NSObject
+ (void)swizzlingInClass:(Class)cls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;

@end
