//
//  ServerManager.m
//  TestProgect
//
//  Created by Разработчик on 14.01.2018.
//  Copyright © 2018 Il. All rights reserved.
//

#import "ServerManager.h"

@implementation ServerManager
+ (instancetype) shared {
   static ServerManager *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[ServerManager alloc] init];
    });
    return shared;
}
- (instancetype)init
    {
        self = [super init];
            
        if (self) {
            
            self.basedURL = @"api.openweathermap.org/data/2.5/weather";
            
            self.sessinManager = [[AFHTTPSessionManager alloc] init];
            
            self.sessinManager.requestSerializer = [[AFHTTPRequestSerializer alloc]init];
            self.sessinManager.responseSerializer = [[AFHTTPResponseSerializer alloc]init];
            
            [self.sessinManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
            [self.sessinManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
            
        }
        return self;
    
    }
-(void) weatherRequestWith:(NSString *)text withBlock:(CompletionBlock) block {
    
        NSDictionary *params = @{
                    @"q":text,
                    @"APPID":@"8b61322725e7702f9f07b65ca439ac3b"
                               };
    
    [self.sessinManager GET:self.basedURL
    parameters:params
     
    progress:nil
     
    success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    block (true,responseObject,nil);
    }
     
    failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    block(false,nil,error);
    }];
    
}
@end
