//
//  TableViewCell.h
//  LHL-June.EveryDo
//
//  Created by Asuka Nakagawa on 2016-07-12.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

//@property (nonatomic) NSString *title;
//@property (nonatomic) NSString *descriptionText;

@property (nonatomic) int priorityNumber;
@property (nonatomic) BOOL isCompletedIndicator;


@end
