//
//  Macros_Size.h
//  Categories
//
//  Created by 翟泉 on 2016/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#ifndef Macros_Size_h
#define Macros_Size_h


#define SSize                   [UIScreen mainScreen].bounds.size

#define SWidth                  SSize.width

#define SHeight                 SSize.height

#define RatioWidth(__width)     (__width)*(SSize.width/375)

#define RatioHeight(__height)   (__height)*(SSize.height/667)


#endif /* Macros_Size_h */
