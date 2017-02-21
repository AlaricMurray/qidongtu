//
//  AppDelegate.m
//  启动图
//
//  Created by 朱明灿 on 17/2/21.
//  Copyright © 2017年 张佳强. All rights reserved.
//

#import "AppDelegate.h"
#import "OnboardingViewController.h"
#import "OnboardingContentViewController.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [self setVC];
    [self.window makeKeyAndVisible];
    return YES;
}




-(OnboardingViewController *)setVC{
    OnboardingContentViewController * firstPage = [OnboardingContentViewController contentWithTitle:@"Welcome" body:@"Takuzu star,lasso the moon" image:[UIImage imageNamed:@"space1"] buttonText:nil action:nil];
    OnboardingContentViewController * secondPage = [OnboardingContentViewController contentWithTitle:@"Music" body:@"My amy of one ,it's the only weapon" image:[UIImage imageNamed:@"headphones"] buttonText:nil action:nil];
    OnboardingContentViewController * thirdPage = [OnboardingContentViewController contentWithTitle:@"Moon" body:@"Lay on the roof ,name every star" image:[UIImage imageNamed:@"testtube"] buttonText:@"Start" action:^{
        [self skipRootVC];
    }];
    
    OnboardingContentViewController * videoPage = [OnboardingContentViewController contentWithTitle:@"Moon" body:@"Lay on the roof ,name every star" videoURL:[NSURL URLWithString:[[NSBundle mainBundle]pathForResource:@"video2" ofType:@"mp4"]] buttonText:@"Start" action:^{
        [self skipRootVC];
    }];
    
    OnboardingViewController * vc = [OnboardingViewController onboardWithBackgroundImage:[UIImage imageNamed:@"tree"] contents:@[firstPage,secondPage,videoPage]];
    vc.shouldFadeTransitions = YES;
    vc.fadePageControlOnLastPage = YES;
    vc.fadeSkipButtonOnLastPage = YES;
    vc.allowSkipping = YES;
    vc.skipHandler = ^{
        [self skipRootVC];
    };
    return vc;
}


-(void)skipRootVC{
    ViewController * vc = [[ViewController alloc]init];
    vc.title = @"Root";
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:vc];
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
