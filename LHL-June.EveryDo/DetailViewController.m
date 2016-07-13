//
//  DetailViewController.m
//  LHL-June.EveryDo
//
//  Created by Asuka Nakagawa on 2016-07-12.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

#import "DetailViewController.h"
#import "tableViewCell.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setTodo:(ToDo *)todo {
    if (_todo != todo) {
        _todo = todo;
        
        // Update the view.
        [self configureView];
    }
}

//- (void)setDetailItem:(id)newDetailItem {
//    if (_detailItem != newDetailItem) {
//        _detailItem = newDetailItem;
//            
//        // Update the view.
//        [self configureView];
//    }
//}

- (void)configureView {
    
    // Update the user interface for the detail item.
    if (self.todo) {
        self.detailDescriptionLabel.text = self.todo.todoDescription;
        self.detailTitleLabel.text = self.todo.title;
        self.priorityLabel.text = [NSString stringWithFormat:@"%i",self.todo.priorityNumber];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.todo = [ToDo new];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}\

@end
