//
//  Encrypt_AES.h
//  EncryptSDK
//
//  Created by tet-cjx on 2018/4/13.
//  Copyright © 2018年 hyd-cjx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Encrypt_AES : NSObject

/**
 AES128加密
 默认模式是ECB
 默认IV是nil
 @param string 需要加密的字符
 @param key 秘钥
 @return 返回Base64加密结果
 */
+ (NSString *)AES128EncryptString:(NSString *)string key:(NSString *)key;

/**
 AES128解密
 默认模式是ECB
 默认IV是nil
 @param string 需要解密的字符
 @param key 秘钥
 @return 返回字符串
 */
+ (NSString *)AES128DecryptString:(NSString *)string key:(NSString *)key;

@end
