//
//  ViewController.m
//  RecipleaseObj-C
//
//  Created by Bouziane Bey on 30/04/2020.
//  Copyright © 2020 Bouziane Bey. All rights reserved.
//

#import "ViewController.h"


const NSString *newIngredient;


@interface ViewController ()

@property (nonatomic) NSMutableArray *tableData;


@end


@implementation ViewController


    




- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableData = [NSMutableArray array];
    //self.activityIndicator.isHidden = YES;
}





- (void)addNewIngredient{
    newIngredient = _ingredientTxtField.text;
}





- (IBAction)addIngredientPressed:(UIButton *)sender {
    [self addNewIngredient];
    [self.tableData addObject: newIngredient];
    _ingredientTxtField.text = @"";
    [self.ingredientTableView reloadData];
}

- (IBAction)clearIngredientPressed:(UIButton *)sender {
    
}

- (IBAction)searchRecipePressed:(UIButton *)sender {
    
}




- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ingredientCell"];
    cell.textLabel.text = [self.tableData objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableData.count;
}


@end
