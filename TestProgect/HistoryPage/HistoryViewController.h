//
//  HistoryViewController.h
//  TestProgect
//
//  Created by Разработчик on 14.01.2018.
//  Copyright © 2018 Il. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "Weathers.h"
#import "CoreDataManager.h"
#import "HistoryTableViewCell.h"
#import "Weather+CoreDataProperties.h"
#import "Weather+CoreDataClass.h"

@interface HistoryViewController : UIViewController{
    id <WeatherDelegate> delegate;
}

@property (strong) NSMutableArray *rowsCount;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak) id <WeatherDelegate> weatherDelegate;
@end
