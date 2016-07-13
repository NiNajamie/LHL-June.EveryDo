//
//  AddViewController.m
//  LHL-June.EveryDo
//
//  Created by Asuka Nakagawa on 2016-07-12.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

#import "AddViewController.h"
@class  MasterViewController;

@interface AddViewController ()


@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *priorityTextField;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.titleTextField.delegate = self;
    self.descriptionTextField.delegate = self;
    self.priorityTextField.delegate = self;
}


- (IBAction)savePressed:(UIButton *)sender {
//    
//    if (!self.todoList) {
//        self.todoList = [NSMutableArray new];
//        
//    }
    self.todo = [ToDo new];
    
    self.todo.title = self.titleTextField.text;
    self.todo.todoDescription = self.descriptionTextField.text;
    NSString *intStr = self.priorityTextField.text;
    self.todo.priorityNumber = [intStr intValue];
    
//    [self.todoList addObject:self.todo];
//    NSLog(@"%@", self.todoList);
    
    
//    NSString *itemToPassBack = @"Pass this value back to MasterVC\n";
    [self.delegate addViewController:self didFinishEnteringItem:self.todo];
    
    // go back to MainViewController
    [self.navigationController popViewControllerAnimated:YES];
}

//#pragma mark- TextField ShouldReturn
//
//- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    
//    if (textField == self.titleTextField) {
//        [textField resignFirstResponder];
//        return NO;
//    }
//    return YES;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//
//    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.view indexPathForSelectedRow:indexPath.row];
//        
//        self.todo = self.todoList[indexPath.row];
//        MasterViewController *mvc = (MasterViewController*)segue.destinationViewController;
//        mvc.object = self.todo;
//    }
//}

@end
