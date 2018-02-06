//
//  weather.h
//  TestProgect
//
//  Created by Разработчик on 14.01.2018.
//  Copyright © 2018 Il. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface weather : NSObject
@property (assign) double lng;
@property (assign) double lat;
@property (strong) NSString *temperature;
@property (strong) NSString *cityName;
@property (strong) NSString *imageURL;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
