//
//  HistoryTableViewCell.h
//  TestProgect
//
//  Created by Разработчик on 14.01.2018.
//  Copyright © 2018 Il. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewCell;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabelCell;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabelCell;
@property (weak, nonatomic) IBOutlet UILabel *dataLabelCell;

@end
