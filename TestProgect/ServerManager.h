//
//  ServerManager.h
//  TestProgect
//
//  Created by Разработчик on 14.01.2018.
//  Copyright © 2018 Il. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef  void(^CompletionBlock) (BOOL success, id respondsObject, NSError *error);

@interface ServerManager : NSObject

    @property (strong) NSString *basedURL;
    @property (strong) AFHTTPSessionManager *sessinManager;

+ (instancetype) shared;
-(void) weatherRequestWith:(NSString *)text withBlock:(CompletionBlock) block;

@end
