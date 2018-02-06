//
//  Weather+CoreDataProperties.h
//  
//
//  Created by Разработчик on 14.01.2018.
//
//

#import "Weather+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Weather (CoreDataProperties)

+ (NSFetchRequest<Weather *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) double lng;
@property (nonatomic) double lat;
@property (nullable, nonatomic, copy) NSDate *date;
@property (nullable, nonatomic, copy) NSString *temperature;
@property (nullable, nonatomic, copy) NSString *imageUrl;

@end

NS_ASSUME_NONNULL_END
