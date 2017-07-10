//
//  MJLHookManager.m
//  BuryingPoint_Demo
//
//  Created by 马金丽 on 17/7/10.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import "MJLHookManager.h"
#import <objc/runtime.h>

@implementation MJLHookManager
+ (void)swizzlingInClass:(Class)cls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector
{
    Class class = cls;
    //class_getInstanceMethod:实例方法
    //class_getClassMethod:类方法
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    //为这个类添加新的方法swizzledMethod,如果已经存在返回NO
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod),  method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        //替换类中已有方法的实现,如果该方法不存在,就去添加该方法
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod),  method_getTypeEncoding(originalMethod));
 
    }else{
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
}
@end
