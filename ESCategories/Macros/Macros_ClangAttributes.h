//
//  Macros_ClangAttributes.h
//  Categories
//
//  Created by 翟泉 on 2016/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#ifndef Macros_ClangAttributes_h
#define Macros_ClangAttributes_h


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-function"
static void DeferBlock(__strong void(^*block)(void)) {
    (*block)();
}
#pragma clang diagnostic pop


/**
 *  作用域结束后会调用Block   后进先出
 *  Defer {
 *      printf("...");
 *  };
 */
#define Defer __strong void(^deferBlock)(void) __attribute__((cleanup(DeferBlock), unused)) = ^



/**
 *  类、方法、属性过期警告
 */
#define Deprecated(instead) NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, instead)



/**
 *  子类方法必须调用父类方法
 */
#define RequiresSuper __attribute__((objc_requires_super))



#endif /* Macros_ClangAttributes_h */
