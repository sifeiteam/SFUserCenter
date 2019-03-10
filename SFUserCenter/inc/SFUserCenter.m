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
#import <SFComponent/SFLanguage.h>
#import <SFComponent/SFImages.h>

@implementation SFUserCenter

#define k_Page_SFUserCenterViewController @"Page_SFUserCenterViewController"

- (void)didFinishStartup {
    //将个人中心注入到tabbar
    NSString * componentName = [SFUserCenter componentName];
    NSDictionary *params = @{
                             @"componentName" : componentName,
                             @"page" : k_Page_SFUserCenterViewController,
                             @"context" : @{},
                             @"tabTitle" : [SFLanguage localizedStringWithKey:@"TabTitle" componentName:componentName],
//                             @"tabImage" : [SFImages imageWithName:@"WX20190227-205248.png" componentName:componentName]
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
