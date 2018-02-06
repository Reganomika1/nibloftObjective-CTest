//
//  Weather+CoreDataProperties.m
//  
//
//  Created by Разработчик on 14.01.2018.
//
//

#import "Weather+CoreDataProperties.h"

@implementation Weather (CoreDataProperties)

+ (NSFetchRequest<Weather *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Weather"];
}

@dynamic name;
@dynamic lng;
@dynamic lat;
@dynamic date;
@dynamic temperature;
@dynamic imageUrl;

@end
