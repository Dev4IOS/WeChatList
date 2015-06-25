//
//  WeChatModel.h
//  WeChatList
//
//  Created by zhengna on 15/6/25.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeChatModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *message;

- (instancetype)initWithDict: (NSDictionary *)dict;

+ (instancetype)weChatWithDict: (NSDictionary *)dict;

@end
