//
//  AddViewController.m
//  LHL-June.EveryDo
//
//  Created by Asuka Nakagawa on 2016-07-12.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

#import "AddViewController.h"

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
    
    if (!self.todoList) {
        self.todoList = [NSMutableArray new];
        
    }
    self.todo = [ToDo new];
    
    self.todo.title = self.titleTextField.text;
    self.todo.todoDescription = self.descriptionTextField.text;
//    todo.priorityNumber = self.priorityTextField.text;
    
    [self.todoList addObject:self.todo];
    NSLog(@"%@", self.todoList);
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
