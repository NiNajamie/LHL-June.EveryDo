//
//  MasterViewController.m
//  LHL-June.EveryDo
//
//  Created by Asuka Nakagawa on 2016-07-12.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"

@interface MasterViewController ()<UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray *objects;
@property ToDo *object;

@property NSString *item;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    
    
    self.object = [[ToDo alloc] initWithTitle:@"Work out" todoDescription:@"work out at gym" priorityNumber:3 isCompleted:NO];
    [self.objects addObject:self.object];
    [self.objects addObject:[[ToDo alloc] initWithTitle:@"Buy milk" todoDescription:@"shop at super market" priorityNumber:2 isCompleted:NO]];
    [self.objects addObject:[[ToDo alloc] initWithTitle:@"Laundry" todoDescription:@"do laundry" priorityNumber:1 isCompleted:NO]];
    
    
    // Fresh data as much as pulling view
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(refreshTable:)
                                                 name:@"refreshTable"
                                               object:nil];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    [self.tableView reloadData];   // Fresh data once
    
}

-(void)refreshTable:(NSNotification*) notification {
}

- (void)addItemViewController:(AddViewController *)controller didFinishEnteringItem:(NSString *)item {
    NSLog(@"This was returned from AddViewController %@",item);
//    self.item = item;
}


- (void)viewWillAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    
    [self performSegueWithIdentifier:@"SegueToAdd" sender:self];

//    if (!self.objects) {
//        self.objects = [[NSMutableArray alloc] init];
//    }
//    [self.objects insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
//    AddViewController *avc = [AddViewController new];
//    avc = [self.storyboard instantiateViewControllerWithIdentifier:@"add"];
//    avc.delegate = self;
//    [self.navigationController pushViewController:avc animated:YES];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        self.object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        
        [controller setTodo:self.object];
        
    } else if ([[segue identifier] isEqualToString:@"SegueToAdd"]) {
        AddViewController *avc = (AddViewController *)[segue destinationViewController];
        avc.delegate = self;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    self.object = self.objects[indexPath.row];
    
    cell.titleLabel.text = self.object.title;
    cell.descriptionLabel.text = self.object.todoDescription;
    cell.priorityLabel.text = [NSString stringWithFormat:@"%i", self.object.priorityNumber];
    
//    cell.completeLabel.text = self.object.isCompleted;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
