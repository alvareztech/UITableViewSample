//
//  TablaViewController.m
//  UITableViewSample
//
//  Created by Daniel Alvarez on 09/02/14.
//  Copyright (c) 2014 Daniel Alvarez. All rights reserved.
//

#import "TablaViewController.h"

@interface TablaViewController () {
    UIColor *blueColor;
}

@property (strong, nonatomic) NSArray *dataArray;

@property (strong, nonatomic) UIView *headerView;
@property (strong, nonatomic) UIView *footerView;

@property (strong, nonatomic) UIButton *spinner1Button;
@property (strong, nonatomic) UIButton *spinner2Button;
@property (strong, nonatomic) UIButton *spinner3Button;

@property (strong, nonatomic) UILabel *amountLabel;
@property (strong, nonatomic) UILabel *currencyLabel;
@property (strong, nonatomic) UILabel *amountTitleLabel;

@end

@implementation TablaViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    blueColor = [UIColor colorWithRed:0 green:122/255.0 blue:1 alpha:1];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.dataArray = [[NSArray alloc] initWithObjects:@"Enero", @"Febrero", @"Marzo", @"Abril", @"Mayo", @"Junio", @"Julio", @"Agosto", @"Septiembre", @"Octubre", @"Noviembre", @"Diciembre", nil];
    
    [self.tableView setBackgroundColor:[UIColor redColor]];
    
    [self.tableView setContentInset:UIEdgeInsetsMake(44, 0, 44, 0)];
    
    //    self.tableView.frame = CGRectMake(0, 0, 320, 500);
    
    [self configHeader];
    [self configFooter];
}

- (void) configHeader {
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 320, 44)];
    
    UIBarButtonItem *oneButton = [[UIBarButtonItem alloc] initWithTitle:@"PUE687142387" style:UIBarButtonItemStyleBordered target:self action:nil];
    
    UIBarButtonItem *twoButton = [[UIBarButtonItem alloc] initWithTitle:@"Y si este periodo es muy largo " style:UIBarButtonItemStyleBordered target:self action:nil];
    
    UIBarButtonItem *threeButton = [[UIBarButtonItem alloc] initWithTitle:@"USD" style:UIBarButtonItemStyleBordered target:self action:nil];
    
    UIBarButtonItem *separator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                               target:self
                                                                               action:nil];
    
    NSMutableArray *items = [[NSMutableArray alloc] initWithObjects:oneButton, separator, twoButton, separator, threeButton, nil];
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolbar setItems:items];
    
    
    
    
    
    
    [self.headerView addSubview:toolbar];
    
    //    self.tableView.tableHeaderView = headerView;
    [self.navigationController.view addSubview:self.headerView];
    

    // Toolbar
    [toolbar setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.navigationController.view addConstraint:[NSLayoutConstraint constraintWithItem:toolbar
                                                                               attribute:NSLayoutAttributeWidth
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.navigationController.view
                                                                               attribute:NSLayoutAttributeWidth
                                                                              multiplier:1
                                                                                constant:0]];

    [self.navigationController.view addConstraint:[NSLayoutConstraint constraintWithItem:toolbar
                                                                               attribute:NSLayoutAttributeHeight
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:nil
                                                                               attribute:NSLayoutAttributeHeight
                                                                              multiplier:1
                                                                                constant:44]];
    
    [self.navigationController.view addConstraint:[NSLayoutConstraint constraintWithItem:toolbar
                                                                               attribute:NSLayoutAttributeCenterX
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.navigationController.view
                                                                               attribute:NSLayoutAttributeCenterX
                                                                              multiplier:1.0
                                                                                constant:0.0]];
    
    [self.navigationController.view addConstraint:[NSLayoutConstraint constraintWithItem:toolbar
                                                                               attribute:NSLayoutAttributeBottom
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.navigationController.view
                                                                               attribute:NSLayoutAttributeTop
                                                                              multiplier:1.0
                                                                                constant:0.0]];
}

- (void) configFooter {
    self.footerView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.footerView setBackgroundColor:[UIColor colorWithRed:0 green:1 blue:0 alpha:0.85]];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 4)];
    lineView.backgroundColor = blueColor;
    [lineView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.amountTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 2, 100, 42)];
    [self.amountTitleLabel setTextColor:[UIColor grayColor]];
    [self.amountTitleLabel setText:@"MONTO"];
    [self.amountTitleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:12]];
    self.amountTitleLabel.backgroundColor = [UIColor clearColor];
    
    self.currencyLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 2, 100, 42)];
    [self.currencyLabel setText:@"USD"];
    [self.currencyLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:22]];
    self.currencyLabel.backgroundColor = [UIColor clearColor];
    
    self.amountLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 2, 100, 42)];
    [self.amountLabel setText:@"1,234.56"];
    [self.amountLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:22]];
    self.amountLabel.backgroundColor = [UIColor clearColor];
    
    [self.footerView addSubview:lineView];
    [self.footerView addSubview:self.amountTitleLabel];
    [self.footerView addSubview:self.currencyLabel];
    [self.footerView addSubview:self.amountLabel];
    [self.footerView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
    [self.navigationController.view addSubview:self.footerView];
    
    // Width constraint, half of parent view width
    [self.navigationController.view addConstraint:[NSLayoutConstraint constraintWithItem:self.footerView
                                                                               attribute:NSLayoutAttributeWidth
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.navigationController.view
                                                                               attribute:NSLayoutAttributeWidth
                                                                              multiplier:1
                                                                                constant:0]];
    
    // Height constraint, half of parent view height
    [self.navigationController.view addConstraint:[NSLayoutConstraint constraintWithItem:self.footerView
                                                                               attribute:NSLayoutAttributeHeight
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:nil
                                                                               attribute:NSLayoutAttributeHeight
                                                                              multiplier:1
                                                                                constant:44]];
    
    // Center horizontally
    [self.navigationController.view addConstraint:[NSLayoutConstraint constraintWithItem:self.footerView
                                                                               attribute:NSLayoutAttributeCenterX
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.navigationController.view
                                                                               attribute:NSLayoutAttributeCenterX
                                                                              multiplier:1.0
                                                                                constant:0.0]];
    
    // Center vertically
    [self.navigationController.view addConstraint:[NSLayoutConstraint constraintWithItem:self.footerView
                                                                               attribute:NSLayoutAttributeBottom
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.navigationController.view
                                                                               attribute:NSLayoutAttributeBottom
                                                                              multiplier:1.0
                                                                                constant:0.0]];
    
    // LINE
    [self.navigationController.view addConstraint:[NSLayoutConstraint constraintWithItem:lineView
                                                                               attribute:NSLayoutAttributeWidth
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.navigationController.view
                                                                               attribute:NSLayoutAttributeWidth
                                                                              multiplier:0.5
                                                                                constant:0]];
    
    [self.navigationController.view addConstraint:[NSLayoutConstraint constraintWithItem:lineView
                                                                               attribute:NSLayoutAttributeHeight
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:nil
                                                                               attribute:NSLayoutAttributeHeight
                                                                              multiplier:1
                                                                                constant:4]];
    
    [self.navigationController.view addConstraint:[NSLayoutConstraint constraintWithItem:lineView
                                                                               attribute:NSLayoutAttributeCenterX
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.navigationController.view
                                                                               attribute:NSLayoutAttributeCenterX
                                                                              multiplier:1
                                                                                constant:0]];
    
    [self.navigationController.view addConstraint:[NSLayoutConstraint constraintWithItem:lineView
                                                                               attribute:NSLayoutAttributeTop // Botton
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.footerView
                                                                               attribute:NSLayoutAttributeTop
                                                                              multiplier:1.0
                                                                                constant:0.0]];
    
    // LINE
//    [self.navigationController.view addConstraint:[NSLayoutConstraint constraintWithItem:self.amountLabel
//                                                                               attribute:NSLayoutAttributeWidth
//                                                                               relatedBy:NSLayoutRelationEqual
//                                                                                  toItem:self.navigationController.view
//                                                                               attribute:NSLayoutAttributeWidth
//                                                                              multiplier:1
//                                                                                constant:0]];
//    
//    [self.navigationController.view addConstraint:[NSLayoutConstraint constraintWithItem:self.amountLabel
//                                                                               attribute:NSLayoutAttributeHeight
//                                                                               relatedBy:NSLayoutRelationEqual
//                                                                                  toItem:nil
//                                                                               attribute:NSLayoutAttributeHeight
//                                                                              multiplier:1
//                                                                                constant:20]];
//    
//    [self.navigationController.view addConstraint:[NSLayoutConstraint constraintWithItem:self.amountLabel
//                                                                               attribute:NSLayoutAttributeCenterX
//                                                                               relatedBy:NSLayoutRelationEqual
//                                                                                  toItem:self.navigationController.view
//                                                                               attribute:NSLayoutAttributeCenterX
//                                                                              multiplier:1
//                                                                                constant:0]];
//    
//    [self.navigationController.view addConstraint:[NSLayoutConstraint constraintWithItem:self.amountLabel
//                                                                               attribute:NSLayoutAttributeBottom
//                                                                               relatedBy:NSLayoutRelationEqual
//                                                                                  toItem:self.footerView
//                                                                               attribute:NSLayoutAttributeTop
//                                                                              multiplier:1.0
//                                                                                constant:0.0]];
//    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)hacerAlgo:(UIButton *)sender {
    NSLog(@"SE PRESIONO HACER ALGO");
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [cell textLabel].text = [_dataArray objectAtIndex:indexPath.row];
    
    if (indexPath.row % 2 == 0) {
        cell.backgroundColor = [UIColor whiteColor];
    } else {
        cell.backgroundColor = [UIColor lightGrayColor];
    }
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */

@end
