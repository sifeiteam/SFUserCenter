//
//  SFUserCenter.m
//  SFUserCenter
//
//  Created by XJY on 2019/3/3.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import "SFUserCenter.h"
#import "SFUserCenterViewController.h"
#import <SFComponent/SFInjection.h>

@implementation SFUserCenter

#define k_Page_SFUserCenterViewController @"Page_SFUserCenterViewController"

+ (BOOL)startupWhenAppLaunched {
    //希望注入到tabbar，所以APP运行后就启动
    return YES;
}

- (void)didFinishStartup {
    //将个人中心注入到tabbar
    NSDictionary *params = @{
                             @"componentName" : [SFUserCenter componentName],
                             @"page" : k_Page_SFUserCenterViewController,
                             @"context" : @{}
                             };
    [[SFInjection sharedInstance] injectWithIdentifier:@"Injection_SFTab"
                                                params:params];
}

- (UIViewController *)getPage:(NSString *)page context:(NSDictionary *)context {
    if (!page || page.length == 0) {
        return nil;
    }
    if ([page isEqualToString:k_Page_SFUserCenterViewController]) {
        SFUserCenterViewController *userCenterViewController = [[SFUserCenterViewController alloc] init];
        return userCenterViewController;
    }
    return nil;
}

@end
