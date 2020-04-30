//
//  ViewController.h
//  RecipleaseObj-C
//
//  Created by Bouziane Bey on 30/04/2020.
//  Copyright © 2020 Bouziane Bey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *ingredientTxtField;
@property (weak, nonatomic) IBOutlet UITableView *ingredientTableView;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

