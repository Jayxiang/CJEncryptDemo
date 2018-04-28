//
//  Encrypt_MD5.h
//  EncryptSDK
//
//  Created by tet-cjx on 2018/3/19.
//  Copyright © 2018年 hyd-cjx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Encrypt_MD5 : NSObject

/**
 MD5加密

 @param string 需要加密的字符串
 @return 返回加密字符串
 */
+ (NSString *)MD5ForString:(NSString *)string;

@end
