//
//  Encrypt_MD5.m
//  EncryptSDK
//
//  Created by tet-cjx on 2018/3/19.
//  Copyright © 2018年 hyd-cjx. All rights reserved.
//

#import "Encrypt_MD5.h"
#import "CommonCrypto/CommonDigest.h"

@implementation Encrypt_MD5

+ (NSString *)MD5ForString:(NSString *)string {
    const char *input = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    return digest;
}

@end
