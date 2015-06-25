//
//  WeChatModel.m
//  WeChatList
//
//  Created by zhengna on 15/6/25.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "WeChatModel.h"

@implementation WeChatModel


- (instancetype)initWithDict: (NSDictionary *)dict{
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)weChatWithDict: (NSDictionary *)dict{

    return [[self alloc] initWithDict:dict];
}


@end
