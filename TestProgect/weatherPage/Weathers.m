//
//  Weathers.m
//  TestProgect
//
//  Created by Разработчик on 14.01.2018.
//  Copyright © 2018 Il. All rights reserved.
//

#import "Weathers.h"

@implementation Weathers
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        NSLog(@"%@",dict);
        self.lng = [dict[@"coord"][@"lon"] doubleValue];
        self.lat = [dict[@"coord"][@"lat"] doubleValue];
        self.temperature = dict[@"main"][@"temp"];
        self.cityName = dict[@"name"];
        self.imageURL = dict[@"weather"][0][@"icon"];
        self.date = [[NSDate alloc]init];
    }
    return self;
}

@end
