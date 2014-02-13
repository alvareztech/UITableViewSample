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

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    blueColor = [UIColor colorWithRed:0 green:122/255.0 blue:1 alpha:1];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _dataArray = [[NSArray alloc] initWithObjects:@"Enero", @"Febrero", @"Marzo", @"Abril", @"Mayo", @"Junio", @"Julio", @"Agosto", @"Septiembre", @"Octubre", @"Noviembre", @"Diciembre", nil];
    
    [self.tableView setBackgroundColor:[UIColor redColor]];

    [self.tableView setContentInset:UIEdgeInsetsMake(44, 0, 44, 0)];

//    self.tableView.frame = CGRectMake(0, 0, 320, 500);

    [self configHeader];
    [self configFooter];
}

- (void) configHeader {
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 320, 44)];
    [_headerView setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.85]];
    
    _spinner1Button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    _spinner2Button = [[UIButton alloc] initWithFrame:CGRectMake(110, 0, 100, 44)];
    _spinner3Button = [[UIButton alloc] initWithFrame:CGRectMake(220, 0, 100, 44)];
    
    [_spinner1Button setTitle:@"Fondo" forState:UIControlStateNormal];
    [_spinner2Button setTitle:@"Cuenta" forState:UIControlStateNormal];
    [_spinner3Button setTitle:@"Periodo" forState:UIControlStateNormal];
    
    [_spinner1Button setTitleColor:blueColor forState:UIControlStateNormal];
    [_spinner1Button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    [_spinner2Button setTitleColor:blueColor forState:UIControlStateNormal];
    [_spinner2Button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    [_spinner3Button setTitleColor:blueColor forState:UIControlStateNormal];
    [_spinner3Button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    [_headerView addSubview:_spinner1Button];
    [_headerView addSubview:_spinner2Button];
    [_headerView addSubview:_spinner3Button];
    
    //    self.tableView.tableHeaderView = headerView;
    [self.navigationController.view addSubview:_headerView];
}

- (void) configFooter {
    _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 436, 320, 44)];
    [_footerView setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.85]];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 4)];
    lineView.backgroundColor = blueColor;
    
    _amountTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 2, 100, 42)];
    [_amountTitleLabel setTextColor:[UIColor grayColor]];
    [_amountTitleLabel setText:@"MONTO"];
    [_amountTitleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:12]];
    
    _currencyLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 2, 100, 42)];
    [_currencyLabel setText:@"USD"];
    [_currencyLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:22]];
    
    _amountLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 2, 100, 42)];
    [_amountLabel setText:@"1,234.56"];
    [_amountLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:22]];
    
    [_footerView addSubview:lineView];
    [_footerView addSubview:_amountTitleLabel];
    [_footerView addSubview:_currencyLabel];
    [_footerView addSubview:_amountLabel];
    
    [self.navigationController.view addSubview:_footerView];
}

- (void)didReceiveMemoryWarning
{
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
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [cell textLabel].text = [_dataArray objectAtIndex:indexPath.row];
    
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
