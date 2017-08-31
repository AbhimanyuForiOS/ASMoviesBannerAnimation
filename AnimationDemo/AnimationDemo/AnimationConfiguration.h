//
//  AnimationConfiguration.h
//  AnimationDemo
//
//  Created by Abhimanyu  on 30/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Model.h"
@interface AnimationConfiguration : NSObject


//top Header configuration
@property(nonatomic) CGFloat  closedHeight;
@property(nonatomic) CGFloat  expandHeight;
@property(nonatomic) CGFloat  hMainSlider;

@property(nonatomic) UIColor  *headerSelectedTextColor;
@property(nonatomic) UIColor  *headerNormalTextColor;

@property(nonatomic)UIFont   *fontTitle;
@property(nonatomic)UIFont   *fontTitleBig;



//animation related
@property(nonatomic)NSTimeInterval animationSpeed;


//bottom Header configuration
@property(nonatomic) CGFloat  bottomSliderH;

@property(nonatomic) UIColor  *selectedIndicatiorColor;
@property(nonatomic) UIColor  *normalImageIndicatorColor;



@property(retain,nonatomic) NSMutableArray * models;






@end
