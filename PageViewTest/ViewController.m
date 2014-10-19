//
//  ViewController.m
//  PageViewTest
//
//  Created by Ivan Lesko on 10/18/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "ViewController.h"
#import "PageViewContentController.h"

@interface ViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIView *pageView;
@property (nonatomic, strong) NSNumber *pageCount;

@property (nonatomic, strong) NSArray *images;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.pageCount = @(3);
    
    [self setupImages];
    
    // Create page view controller
    self.pageViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
                               instantiateViewControllerWithIdentifier:@"pageViewController"];
    
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
    
    [self addPageContentViewControllerToView];
}

- (void)viewDidAppear:(BOOL)animated {
}

- (void)setupImages {
    self.images = @[
                    [UIImage imageNamed:@"image1.png"],
                    [UIImage imageNamed:@"image2.png"],
                    [UIImage imageNamed:@"image3.png"]
                    ];
}

- (void)addPageContentViewControllerToView {
    PageViewContentController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0,
                                                    0,
                                                    self.pageView.frame.size.width,
                                                    self.pageView.frame.size.height);
    
    [self.pageView addSubview:self.pageViewController.view];
}

- (PageViewContentController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self pageCount] == 0) || (index >= self.pageCount.integerValue)) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageViewContentController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewContentController"];
    pageContentViewController.view.frame = CGRectMake(0,
                                                      0,
                                                      320,
                                                      320);
    
    pageContentViewController.pageIndex = index;
    
    UIImage *image = self.images[index];
    
    /// Set content view controller image.
    [pageContentViewController setImageViewImage:image];
    
    return pageContentViewController;
}

#pragma mark - UIPageViewControllerDelegate

- (void)pageViewController:(UIPageViewController *)pageViewController
        didFinishAnimating:(BOOL)finished
   previousViewControllers:(NSArray *)previousViewControllers
       transitionCompleted:(BOOL)completed
{
    if (completed && pageViewController) {
        PageViewContentController *currentVc = (pageViewController.viewControllers)[0];
        self.pageControl.currentPage = currentVc.pageIndex;
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(PageViewContentController *)viewController
{
    NSUInteger index = viewController.pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == self.pageCount.unsignedIntegerValue) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(PageViewContentController *)viewController
{
    NSUInteger index = viewController.pageIndex;
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

#pragma mark - Page View Controller Data Source


@end
