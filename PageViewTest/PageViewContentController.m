//
//  PageViewContentController.m
//  PageViewTest
//
//  Created by Ivan Lesko on 10/18/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "PageViewContentController.h"

@interface PageViewContentController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) NSData *imgData;

@end

@implementation PageViewContentController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;    
- (void)awakeFromNib {
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.imgData) {
        self.imageView.image = [UIImage imageWithData:self.imgData];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setImageWithData:(NSData*)data
{
    self.imgData = data;
    self.imageView.image = [UIImage imageWithData:self.imgData];
}

- (void)setImageViewImage:(UIImage *)image {
    self.imageView.image = image;
}

@end
