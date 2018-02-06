//
//  weather.m
//  TestProgect
//
//  Created by Разработчик on 14.01.2018.
//  Copyright © 2018 Il. All rights reserved.
//

#import "weather.h"

@implementation weather
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.lng = [dict[@"coord"][@"lon"] doubleValue];
        self.lat = [dict[@"coord"][@"lat"] doubleValue];
        self.temperature = dict[@"main"][@"temp"];
        self.cityName = dict[@"name"];
        self.imageURL = dict[@"weather"][@"icon"];
    }
    return self;
}
@end
