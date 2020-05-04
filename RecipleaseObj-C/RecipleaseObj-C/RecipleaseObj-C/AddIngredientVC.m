//
//  ViewController.m
//  RecipleaseObj-C
//
//  Created by Bouziane Bey on 30/04/2020.
//  Copyright © 2020 Bouziane Bey. All rights reserved.
//

#import "AddIngredientVC.h"


const NSString *newIngredient;


@interface AddIngredientVC ()

@property (nonatomic) NSMutableArray *tableData;


@end


@implementation AddIngredientVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableData = [NSMutableArray array];
    self.activityIndicator.hidden = true;
    self.activityIndicator.hidesWhenStopped = true;
    self.addIngredientBtn.layer.cornerRadius = 10;
    self.clearIngredientBtn.layer.cornerRadius = 7;
    self.searchBtn.layer.cornerRadius = 8;
}

- (void)addNewIngredient{
    newIngredient = _ingredientTxtField.text;
}

- (IBAction)addIngredientPressed:(UIButton *)sender {
    
    if ([self.ingredientTxtField.text  isEqual: @""]){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"No ingredients !" message:@"Add an ingredient in the text field next to the button" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Ok, Thanks" style:UIAlertActionStyleDefault handler: ^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        [self addNewIngredient];
        [self.tableData addObject: newIngredient];
        _ingredientTxtField.text = @"";
        [self.ingredientTableView reloadData];
    }
}

- (void)clearIngredient{
    [self.tableData removeAllObjects];
    [self.ingredientTableView reloadData];
}

- (IBAction)clearIngredientPressed:(UIButton *)sender {
    [self clearIngredient];
}

- (IBAction)searchRecipePressed:(UIButton *)sender {
    self.activityIndicator.hidden = false;
    self.searchBtn.hidden = true;
    if ([self.tableData count] == 0){
        self.searchBtn.hidden = false;
        self.activityIndicator.hidden = true;
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"No ingredients !" message:@"Add some ingredients with the button add !" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleDefault handler: ^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    } else {
        NSLog(@"Appel réseau ici");
    }
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ingredientCell"];
    cell.textLabel.text = [self.tableData objectAtIndex:indexPath.row];
    [cell.textLabel setFont:[UIFont fontWithName:@"Marker Felt" size: 17]];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableData.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    int sectionNumber;
    UILabel *noDataText = [[UILabel alloc]init];
    sectionNumber = 1;
    if (self.tableData.count > 0) {
        self.ingredientTableView.backgroundView = nil;
        sectionNumber = 1;
    } else {
        noDataText.text = @"No ingredients yet ! Add some with the add button.";
        [noDataText setFont:[UIFont fontWithName:@"Marker Felt" size:24]];
        noDataText.numberOfLines = 0;
        noDataText.textAlignment = NSTextAlignmentCenter;
        noDataText.textColor = [UIColor whiteColor];
        self.ingredientTableView.backgroundView = noDataText;
    }
    return sectionNumber;
}


@end
