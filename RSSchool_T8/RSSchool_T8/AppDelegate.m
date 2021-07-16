//
//  AppDelegate.m
//  RSSchool_T8
//
//  Created by Taisia Kataieva on 16.7.21..
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *rootVC = [[ViewController alloc] init];
    window.rootViewController = rootVC;
    self.window = window;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
