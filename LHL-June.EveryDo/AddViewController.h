//
//  AddViewController.h
//  LHL-June.EveryDo
//
//  Created by Asuka Nakagawa on 2016-07-12.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"
@class AddViewController;

@protocol AddViewControllerDelegate <NSObject>

- (void)addItemViewController:(AddViewController *)controller didFinishEnteringItem:(NSString *)item;


@end

@interface AddViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@property (nonatomic) ToDo *todo;
@property (nonatomic) NSMutableArray *todoList;
@property (nonatomic, weak) id <AddViewControllerDelegate> delegate;
@end
