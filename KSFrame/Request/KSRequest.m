//
//  KSRequest.m
//  KSFrame
//
//  Created by JoyTouch9 on 14-12-15.
//  Copyright (c) 2014年 HTY. All rights reserved.
//

#import "KSRequest.h"
#import <objc/runtime.h>
@implementation KSRequest
kSingleton(KSRequest)
- (void)requestDataWithParams   :(NSDictionary *)params
        forPath                 :(NSString *)path
        finished                :(void (^)(id data))success
        failed                  :(void (^)(NSString *error))fail
{
    NSString                        *urlTemp = [path encodeStringWithUTF8];
    AFHTTPRequestOperationManager   *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:urlTemp parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        success(dic);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        fail(error.description);
    }];
}

- (void)requestDataWithParams   :(NSDictionary *)params
        Class                   :(Class)objClass
        finished                :(void (^)(id object))success
        failed                  :(void (^)(NSString *error))fail
{
    NSString                        *urlTemp = [[self actionName:objClass] encodeStringWithUTF8];
    AFHTTPRequestOperationManager   *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:urlTemp parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        success([self reflectDataObject:objClass FromOtherObject:dic]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        fail(error.description);
    }];
}

- (void)postDataWithParams  :(NSDictionary *)params
        forPath             :(NSString *)path
        finished            :(void (^)(id data))success
        failed              :(void (^)(NSString *error))fail
{
    NSString                        *urlTemp = [path encodeStringWithUTF8];
    AFHTTPRequestOperationManager   *manager = [AFHTTPRequestOperationManager manager];

    [manager POST:urlTemp parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        success(dic);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fail(error.description);
    }];
}

- (void)postDataWithParams  :(NSDictionary *)params
        Class               :(Class)objClass
        finished            :(void (^)(id object))success
        failed              :(void (^)(NSString *error))fail
{
    NSString                        *urlTemp = [[self actionName:objClass] encodeStringWithUTF8];
    AFHTTPRequestOperationManager   *manager = [AFHTTPRequestOperationManager manager];

    [manager POST:urlTemp parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id obj = [[objClass alloc]init];
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        [self reflectDataObject:obj FromOtherObject:dic];
            success(obj);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fail(error.description);
    }];
}

- (id)reflectDataObject:(Class)class FromOtherObject:(id)dataSource
{
    if ([dataSource isKindOfClass:[NSArray class]]) {
       NSMutableArray *arr=[NSMutableArray array];
        for (id obj in dataSource) {
            [arr addObject:[self reflectDataObject:class FromOtherObject:obj]];
        }
        NSLog(@"%@",[arr class]);
        return arr;
    }else if ([dataSource isKindOfClass:[NSDictionary class]]) {
        id data=[[class alloc]init];
        for (NSString *key in [self getPropertyList :class]) {
               BOOL ret = ([dataSource valueForKey:key] == nil) ? NO : YES;
            
                if (ret) {
                    id propertyValue = [dataSource valueForKey:key];
                    [data setValue:[self reflectDataObject:class FromOtherObject:propertyValue] forKey:key];
                    // 该值不为NSNULL，并且也不为nil
                }
            }
        NSLog(@"%@",[data class]);
        return data;
    }else {
        if (![dataSource isKindOfClass:[NSNull class]] && (dataSource != nil)) {
            return dataSource;
        }
    }
    return @"";
}

- (NSArray *)getPropertyList:(Class)class
{
    NSMutableArray  *propertyNamesArray = [NSMutableArray array];
    unsigned int    propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList(class, &propertyCount);

    for (unsigned int i = 0; i < propertyCount; ++i) {
        objc_property_t property = properties[i];
        const char      *name = property_getName(property);
        [propertyNamesArray addObject:[NSString stringWithUTF8String:name]];
    }

    free(properties);
    return propertyNamesArray;
}
/**
 *  通过约定好的类的命名格式，通过类名，类获取请求参数类对象对应的action
 *  获取actionName的思路是将类名从第九个字符开始截去，也即是将TReqParam这9位字符串截去
 *  只保留后面的字符串，然后将剩余字符串的首字母变成小写
 *
 *  @return 返回请求参数累对象对应的action
 */
- (NSString *)actionName:(Class)class
{
    NSString *t_actionName = nil;
    const char *t_className = class_getName(class);
    if (strlen(t_className) <= 2)
    {
        t_actionName = @"";
    }
    else
    {
        unsigned long t_strLength = strlen(t_className);
        //因为我们使用的是strncpy函数拷贝字符串的，因此我们需要分配的空间比实际字符数多1
        //因为最后以为我们要添加字符串结束标志'\0'
        //如果使用strcpy函数，那么就不必考虑这个问题了，字符串该多长就分配多长的空间
        //并且也不需要手动在最后一个位置加'\0'
        char *t_action = (char *)malloc((t_strLength - 1) * sizeof(char));
        strncpy(t_action, t_className + 2, t_strLength - 2);
        t_action[t_strLength - 2] = '\0';
        t_action[0] = tolower(t_action[0]);
        t_actionName = [NSString stringWithUTF8String:t_action];
        free(t_action);
    }
    return [NSString stringWithFormat:@"%@%@.php", kMainWebsite, t_actionName];
}

@end