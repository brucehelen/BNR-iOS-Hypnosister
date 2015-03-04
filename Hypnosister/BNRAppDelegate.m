//
//  BNRAppDelegate.m
//  Hypnosister
//
//  Created by 朱正晶 on 15-2-27.
//  Copyright (c) 2015年 China. All rights reserved.
//

#import "BNRAppDelegate.h"
#import "BNRHypnosisView.h"

@interface BNRAppDelegate()<UIScrollViewDelegate>
@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)BNRHypnosisView *hypnosisView;
@end

@implementation BNRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

//    CGRect firstFrame = self.window.bounds;
//    BNRHypnosisView *firstView = [[BNRHypnosisView alloc] initWithFrame:firstFrame];
//    [self.window addSubview:firstView];
    
    CGRect screenRect = self.window.bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;
    bigRect.size.height *= 2.0;

    _scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    _scrollView.pagingEnabled = NO;
    _scrollView.delegate = self;
    _scrollView.contentSize = bigRect.size;
    // 设置最大伸缩比例和最小缩放比例，必须不一样，否则不会调用viewForZoomingInScrollView方法
    _scrollView.maximumZoomScale = 1.5;
    _scrollView.minimumZoomScale = 0.5;

    _hypnosisView = [[BNRHypnosisView alloc] initWithFrame:bigRect];
    [_scrollView addSubview:_hypnosisView];

    [self.window addSubview:_scrollView];
    self.window.backgroundColor = [UIColor whiteColor];

    [self.window makeKeyAndVisible];
    return YES;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    NSLog(@"viewForZoomingInScrollView");
    return _hypnosisView;
}

-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    NSLog(@"scrollViewDidEndZooming, scale = %f", scale);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScroll");
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
