//
//  AppDelegate.m
//  Aspects_OCDemo
//
//  Created by 李娜 on 2019/2/27.
//  Copyright © 2019 李娜. All rights reserved.
//

#import "AppDelegate.h"
#import "Aspects.h"
#import "HomeViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window = window;
    
    HomeViewController *rootVC = [[HomeViewController alloc] init];
    UINavigationController *rootNav = [[UINavigationController alloc] initWithRootViewController:rootVC];
    self.window.rootViewController = rootNav;
    [self.window makeKeyAndVisible];
    
    // 勾取 UIViewController 类所有实例的viewWillAppear: 方法
    [UIViewController aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info){
        UIViewController *tempVC = (UIViewController *)info.instance;
        NSLog(@"%@ viewWillAppear",[tempVC class]);
    } error:nil];
    
    //勾取UIControl 类的所有实例的sendAction:to:forEvent:方法
    [UIControl aspect_hookSelector:@selector(sendAction:to:forEvent:) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> info){
        UIControl *control = (UIControl *)info.instance;
        if ([control isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)control;
            NSLog(@"%@",btn.titleLabel.text);
        }
    } error:nil];
    
    // 勾取rootVC 实例的viewDidLoad 方法
    [rootVC aspect_hookSelector:@selector(viewDidLoad) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info){
        NSLog(@"RootViewController viewDidLoad");
    } error:nil];
    
    return YES;
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
