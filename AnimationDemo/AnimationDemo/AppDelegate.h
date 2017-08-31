//
//  AppDelegate.h
//  AnimationDemo
//
//  Created by Abhimanyu  on 30/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

