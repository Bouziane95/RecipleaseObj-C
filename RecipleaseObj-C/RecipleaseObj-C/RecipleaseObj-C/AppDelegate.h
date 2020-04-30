//
//  AppDelegate.h
//  RecipleaseObj-C
//
//  Created by Bouziane Bey on 30/04/2020.
//  Copyright © 2020 Bouziane Bey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

