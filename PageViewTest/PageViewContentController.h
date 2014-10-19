//
//  PageViewContentController.h
//  PageViewTest
//
//  Created by Ivan Lesko on 10/18/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageViewContentController : UIViewController

@property (nonatomic) NSUInteger pageIndex;

- (void) setImageWithData:(NSData*)data;
- (void) setImageViewImage:(UIImage *)image;

@end
