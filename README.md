# SFUserCenter

个人中心



### 组件名

SFUserCenter


调用[[SFInjection sharedInstance] injectWithIdentifier: params:];注入行

- **identifier：** Injection_SFUserCenter

- **params：**

  - **icon：** 图标，必须是UIImage

  - **title：** 标题

  - **componentName：** 接收事件的组件名

  - **eventName：** 事件名，个人中心点击时行时触发该事件，由componentName对应的组件进行接收并处理

```
NSString *componentName = @"SFComponentA";
NSDictionary *params = @{
    @"icon" : iconImage,
    @"title" : [SFLanguage localizedStringWithKey:@"title" componentName:componentName],
    @"componentName" : componentName,
    @"eventName" : k_Event_SFComponentA_UserCenter
};
[[SFInjection sharedInstance] injectWithIdentifier:@"Injection_SFUserCenter" params:params];
```

组件SFComponentA接收事件。context中传递个人中心的上下文，可以通过@"SFUserCenterViewController"获取个人中心的VC。

```
- (id)responseEvent:(NSString *)eventName context:(NSDictionary *)context {
    if ([eventName isEqualToString:k_Event_SFComponentA_UserCenter]) {
        UIViewController *viewController = [context objectForKey:@"SFUserCenterViewController"];
        
        //处理
    }
    return nil;
}
```








