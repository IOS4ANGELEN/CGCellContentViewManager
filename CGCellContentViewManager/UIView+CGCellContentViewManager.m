//
//  UIView+CGCellContentViewManager.m
//  CGCellContentViewManager
//
//  Created by Coder Gin on 2016-11-11
//
// Copyright (c) 2016 Coder Gin ( https://github.com/CoderGin/CGCellContentViewManager )
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import "UIView+CGCellContentViewManager.h"
#import <objc/runtime.h>

#define CG_Instance_MethodSwizzle(originalSelector, swizzledSelector) \
{ \
    Method originalMethod = class_getInstanceMethod(self, originalSelector); \
    Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector); \
     \
    BOOL success = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod)); \
    if (success) { \
        class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod)); \
    } else { \
        method_exchangeImplementations(originalMethod, swizzledMethod); \
    } \
}


@interface UIView (_CGCellContentViewManager)

@property (nonatomic, assign) BOOL cg_forbidSetBackgroundColor;

@end

@implementation UIView (CGCellContentViewManager)

+ (void)load {
    
    CG_Instance_MethodSwizzle(@selector(setBackgroundColor:), @selector(cg_setBackgroundColor:))
}

- (void)cg_setBackgroundColor:(UIColor *)backgroundColor {
    
    if (self.cg_cellContentViewManagerDisabled) {
        [self cg_setBackgroundColor:backgroundColor];
        return ;
    }
    
    if (!self.cg_forbidSetBackgroundColor) {
        [self cg_setBackgroundColor:backgroundColor];
        return ;
    }
}

- (BOOL)cg_forbidSetBackgroundColor {
    
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCg_forbidSetBackgroundColor:(BOOL)cg_forbidSetBackgroundColor {
    
    objc_setAssociatedObject(self, @selector(cg_forbidSetBackgroundColor), @(cg_forbidSetBackgroundColor), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)cg_cellContentViewManagerDisabled {
    
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCg_cellContentViewManagerDisabled:(BOOL)cg_cellContentViewManagerDisabled {
    
    objc_setAssociatedObject(self, @selector(cg_cellContentViewManagerDisabled), @(cg_cellContentViewManagerDisabled), OBJC_ASSOCIATION_ASSIGN);
}

@end


@implementation UITableViewCell (CGCellContentViewManager)

+ (void)load {
    
    CG_Instance_MethodSwizzle(@selector(setHighlighted:animated:), @selector(cg_setHighlighted:animated:))
}

- (void)cg_setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    
    self.cg_cellContentViewManagerDisabled ? 0 : [self traverseSubviewsInView:self.contentView withTargetValue:highlighted];
    
    [self cg_setHighlighted:highlighted animated:animated];
}

- (void)traverseSubviewsInView:(UIView *)view withTargetValue:(BOOL)targetValue {
    
    [view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull subview, NSUInteger idx, BOOL * _Nonnull stop) {
        subview.cg_forbidSetBackgroundColor = targetValue;
        [self traverseSubviewsInView:subview withTargetValue:targetValue];
    }];
}

@end
