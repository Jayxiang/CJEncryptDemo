//
//  ViewController.m
//  CJEncryptDemo
//
//  Created by tet-cjx on 2018/4/16.
//  Copyright © 2018年 hyd-cjx. All rights reserved.
//

#import "ViewController.h"
#import "CJEncryptHeader.h"
#import "RSAOC.h"
#define PUBLICK_KEY @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC5K5/SikLCQF6Lw6si4lXYbw2WNJ04XOVm1PWsN5WFD9w/bNO7Y6OHzs9Imy+kF7qZHLuepYGFxVeY7bZOiL9t09pQC5QmWp8CQB4y2/18+NBx02oyUej8RA/tQ3OBz7ffz3nZSUu2aI1T6iUvOu50tm95FwtB1Tb3ckChqClERwIDAQAB"
#define PRIVATE_KEY @"MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBALkrn9KKQsJAXovDqyLiVdhvDZY0nThc5WbU9aw3lYUP3D9s07tjo4fOz0ibL6QXupkcu56lgYXFV5jttk6Iv23T2lALlCZanwJAHjLb/Xz40HHTajJR6PxED+1Dc4HPt9/PedlJS7ZojVPqJS867nS2b3kXC0HVNvdyQKGoKURHAgMBAAECgYA9+0U/IzqfbQ54uCFjxuE3Vkz0912dDTNYjXZClER/SsTNki75bavCfM5TnmZ/BdZXBBAlVX8aeOkObpt0hD+XAAsp3vGm2WZ9PzOsCcURijHnZ1JC4fCD0Zbu33tDWJohTONHXc2daZCc5KlFAGEGfgSRvTyY7zjE0BhnvU2WeQJBAPMVHL2rTdpbc+AWIMmZ3VeEMJMqL0i62UF8dEzxVwNJdNlsvG/XNPavzMiyfYmUJjRCGuHKH0YKmNpVasUOonMCQQDDAq2FTMbGJneuVjJtTqM+n+uUmmdS2M9lFWYBoNBk8yarW5zCzeTGn2d9nTMLdG/TQhWuvp4/2HmcTdltYB3dAkAe+2TjY88Tcq6NNCTPrTXB7s5GI41NRstkBlnIaMY/XABxqeNGmfZdLsD6H43SmDhaVsaYWqurwLQEt/hYz2mzAkEAi0x4YsXLH3QO/at47ffESFG32DjLIbTZwN0eNn+HHPVLZBBW1Bh7GR54sJQACGiuEHwePOrQ485gYDSD4ctMyQJBAOnzo5C9pv7V+wmUhdU7TQbaA8m771VWgIe/h1q1o8D99jQRmL0TEtmHH+GkvmrQbIM/5nsGHhSFI9S2tmbTn6M="

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *encryptText;
@property (weak, nonatomic) IBOutlet UILabel *backLabel;
@property (nonatomic, strong) NSString *encryptStr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)encryptMD5Click:(id)sender {
    NSString *md5 = [Encrypt_MD5 MD5ForString:_encryptText.text];
    self.backLabel.text = [NSString stringWithFormat:@"md5加密后:%@",md5];
}
- (IBAction)encrypt3DesClick:(id)sender {
    UIButton *button = (UIButton *)sender;
    if (!button.selected) {
        _encryptStr = [Encrypt_3DES des3EncryptString:_encryptText.text publicKey:PUBLICK_KEY];
        self.backLabel.text = [NSString stringWithFormat:@"3des加密后:%@",_encryptStr];
    } else {
        NSString *desDecrypt = [Encrypt_3DES des3DecryptString:_encryptStr publicKey:PUBLICK_KEY];
        self.backLabel.text = [NSString stringWithFormat:@"3des解密后:%@",desDecrypt];
    }
    button.selected = !button.selected;
    
}
- (IBAction)encryptAesClick:(id)sender {
    UIButton *button = (UIButton *)sender;
    if (!button.selected) {
        _encryptStr = [Encrypt_AES AES128EncryptString:_encryptText.text key:PUBLICK_KEY];
        self.backLabel.text = [NSString stringWithFormat:@"aes加密后:%@",_encryptStr];
    } else {
        NSString *desDecrypt = [Encrypt_AES AES128DecryptString:_encryptStr key:PUBLICK_KEY];
        self.backLabel.text = [NSString stringWithFormat:@"aes解密后:%@",desDecrypt];
    }
    button.selected = !button.selected;
    
}
- (IBAction)encryptRsaClick:(id)sender {
    UIButton *button = (UIButton *)sender;
    if (!button.selected) {
        _encryptStr = [RSAOC encryptString:_encryptText.text byDerFile:@"rsa_public_key"];

//        _encryptStr = [Encrypt_RSA rsaEncryptString:_encryptText.text publicKey:PUBLICK_KEY];
        self.backLabel.text = [NSString stringWithFormat:@"rsa加密后:%@",_encryptStr];
    } else {
        NSString *desDecrypt = [RSAOC decryptString:_encryptStr byP12File:@"rsa_private_key" password:@"123"];

//        NSString *desDecrypt = [Encrypt_RSA rsaDecryptString:_encryptStr privateKey:PRIVATE_KEY];
        self.backLabel.text = [NSString stringWithFormat:@"rsa解密后:%@",desDecrypt];
    }
    button.selected = !button.selected;
}

- (IBAction)signClick:(id)sender {
    UIButton *button = (UIButton *)sender;
    if (!button.selected) {
        _encryptStr = [RSAOC signString:_encryptText.text byP12File:@"rsa_private_key" password:@"123"];
//        _encryptStr = [Encrypt_RSA signString:_encryptText.text privateKey:PRIVATE_KEY];
        self.backLabel.text = [NSString stringWithFormat:@"rsa加签后:%@",_encryptStr];
    } else {
        BOOL sign = [RSAOC verifyString:_encryptText.text sign:_encryptStr byDerFile:@"rsa_public_key"];
//        BOOL sign = [Encrypt_RSA verifyString:_encryptText.text sign:_encryptStr pubKey:PUBLICK_KEY];
        self.backLabel.text = [NSString stringWithFormat:@"rsa验签结果:%@",sign ? @"成功" : @"失败"];
    }
    button.selected = !button.selected;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
