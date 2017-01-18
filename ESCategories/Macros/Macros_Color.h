//
//  Macros_Color.h
//  Categories
//
//  Created by 翟泉 on 2016/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#ifndef Macros_Color_h
#define Macros_Color_h


#define ColorRGBA(r, g, b, a)               [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

#define ColorRGB(r, g, b)                   ColorRGBA(r, g, b, 1.0)

#define ColorWhiteAlpha(w, a)               [UIColor colorWithWhite:(w)/255.0 alpha:(a)]

#define ColorWhite(w)                       ColorWhiteAlpha(w, 1.0)


#endif /* Macros_Color_h */
