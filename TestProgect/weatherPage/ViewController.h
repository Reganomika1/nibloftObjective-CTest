//
//  ViewController.h
//  TestProgect
//
//  Created by Разработчик on 13.01.2018.
//  Copyright © 2018 Il. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Weathers.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "OWMWeatherAPI.h"
#import "Weather+CoreDataProperties.h"
#import "Weather+CoreDataClass.h"
#import "CoreDataManager.h"
@import GooglePlaces;
@import GoogleMaps;
@import CoreLocation;

@protocol WeatherDelegate<NSObject>
@optional
-(void)addMarker:(Weathers *)weather;
@end

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *findSearchText;
@property (weak, nonatomic) IBOutlet UILabel *weatherLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weatherImage;

@property (weak, nonatomic) IBOutlet GMSMapView *mapView;
@property (strong) CLLocationManager *locationManager;
@property (strong)  GMSMarker *marker;
@property (strong) OWMWeatherAPI *weatherAPI;
@end

