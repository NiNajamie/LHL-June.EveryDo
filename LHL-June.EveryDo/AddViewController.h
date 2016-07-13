//
//  AddViewController.h
//  LHL-June.EveryDo
//
//  Created by Asuka Nakagawa on 2016-07-12.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@interface AddViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (nonatomic) ToDo *todo;
@property (nonatomic) NSMutableArray *todoList;

@end
