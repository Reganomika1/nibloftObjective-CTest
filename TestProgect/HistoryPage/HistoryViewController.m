//
//  HistoryViewController.m
//  TestProgect
//
//  Created by Разработчик on 14.01.2018.
//  Copyright © 2018 Il. All rights reserved.
//

#import "HistoryViewController.h"



@interface HistoryViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:true];
    
    [self.rowsCount removeAllObjects];
    
    self.rowsCount = [NSMutableArray arrayWithArray:[[CoreDataManager sharedInstance] getWeather]];
    NSLog(@"%lu", (unsigned long)self.rowsCount.count);
    [self.tableView reloadData];
}

#pragma mark -UITableViewDataSource
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    HistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HistoryCell"];
    
    Weather *weather = self.rowsCount[indexPath.row];
    
    NSDateFormatter * formatter =  [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@" HH:mm:ss dd MMM yyyy"];
    NSString *dateString = [formatter stringFromDate:weather.date];
    
    NSURL *url = [[NSURL alloc]initWithString:weather.imageUrl];
    
    [cell.imageView sd_setImageWithURL:url];
    cell.dataLabelCell.text = dateString;
    cell.temperatureLabelCell.text = [NSString stringWithFormat:@"%ld",(long)[weather.temperature integerValue]];
    cell.cityNameLabelCell.text = weather.name;
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.rowsCount count];
}
#pragma mark -UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Weather *weather = self.rowsCount[indexPath.row];
    Weathers *weathers = [[Weathers alloc]init];
    weathers.cityName = weather.name;
    weathers.lat = weather.lat;
    weathers.lng = weather.lng;
    weathers.temperature = weather.temperature;
    weathers.date = weather.date;
    weathers.imageURL = weather.imageUrl;
    [self.weatherDelegate addMarker:weathers];
    self.tabBarController.selectedIndex = 0;
}

@end
