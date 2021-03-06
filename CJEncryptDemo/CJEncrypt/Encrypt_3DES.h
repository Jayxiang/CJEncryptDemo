//
//  Encrypt_3DES.h
//  EncryptSDK
//
//  Created by tet-cjx on 2018/3/19.
//  Copyright © 2018年 hyd-cjx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Encrypt_3DES : NSObject

/**
 3DES加密
 默认ECB模式
 @param string 加密字符串
 @return 加密后字符串
 */
+ (NSString *)des3EncryptString:(NSString *)string publicKey:(NSString *)pubKey;

/**
 3DES解密

 @param string 解密字符串
 @return 解密后字符串
 */
+ (NSString *)des3DecryptString:(NSString *)string publicKey:(NSString *)pubKey;


@end
