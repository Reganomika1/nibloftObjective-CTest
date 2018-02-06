//
//  ViewController.m
//  TestProgect
//
//  Created by Разработчик on 13.01.2018.
//  Copyright © 2018 Il. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<GMSMapViewDelegate,CLLocationManagerDelegate,UITextFieldDelegate,WeatherDelegate>
    

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.weatherAPI = [[OWMWeatherAPI alloc] initWithAPIKey:@"8b61322725e7702f9f07b65ca439ac3b"];
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    
    self.mapView.myLocationEnabled = YES;
    self.mapView.mapType = kGMSTypeHybrid;
    self.mapView.settings.compassButton = YES;
    self.mapView.settings.myLocationButton = YES;
    [self.weatherAPI setTemperatureFormat:kOWMTempCelcius];
    [self.locationManager startUpdatingLocation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -Action
- (IBAction)searchAction:(UIButton *)sender {
    [self.weatherAPI currentWeatherByCityName:self.findSearchText.text withCallback:^(NSError *error, NSDictionary *result) {
        if (error) {
    
            return;
        }
        NSLog(@"dojdalis");
        Weathers *weather = [[Weathers alloc] initWithDict:result];
        
        self.weatherLabel.text =[NSString stringWithFormat:@"%ld °C",(long)[weather.temperature integerValue]];
        
        NSURL *url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", weather.imageURL]];
        [self.weatherImage sd_setImageWithURL:url];
        
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(weather.lat, weather.lng);
        
        self.marker.position = coordinate;
        self.marker.map = self.mapView;
        
        GMSCameraUpdate *cameraUpdate = [GMSCameraUpdate setCamera:[GMSCameraPosition cameraWithTarget:coordinate zoom:6]];
        
        [self.mapView moveCamera:cameraUpdate];
        
        [[CoreDataManager sharedInstance] saveWeatherWithParams:weather.date lng:weather.lng lat:weather.lat temperature:weather.temperature imageURL:[NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", weather.imageURL] name:weather.cityName];
    }];
    NSLog(@"Jdem server");
}
#pragma mark -CLLocationManagerDelegate
    -(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations{
        CLLocation *location = locations.firstObject;
        self.mapView.camera = [GMSCameraPosition cameraWithTarget:location.coordinate zoom:6];
        [self.locationManager stopUpdatingLocation];
        
    }
- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    return YES;
}
#pragma mark -WeatherDelegate
-(void)addMarker:(Weathers *)weather {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(weather.lat, weather.lng);
    
    self.marker.position = coordinate;
    self.marker.map = self.mapView;
    
    GMSCameraUpdate *cameraUpdate = [GMSCameraUpdate setCamera:[GMSCameraPosition cameraWithTarget:coordinate zoom:6]];
    
    [self.mapView moveCamera:cameraUpdate];
    
    
    NSURL *url = [[NSURL alloc]initWithString:weather.imageURL];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.weatherImage sd_setImageWithURL:url];
        self.weatherLabel.text =[NSString stringWithFormat:@"%ld °C",(long)[weather.temperature integerValue]];
    });
    
    self.findSearchText.text = weather.cityName;
    NSLog(@"%@",weather.imageURL);
}
@end

