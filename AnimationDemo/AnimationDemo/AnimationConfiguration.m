//
//  AnimationConfiguration.m
//  AnimationDemo
//
//  Created by Abhimanyu  on 30/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

#import "AnimationConfiguration.h"

@implementation AnimationConfiguration
//TOP Related
@synthesize hMainSlider;
@synthesize closedHeight;
@synthesize expandHeight;
@synthesize fontTitle;
@synthesize headerNormalTextColor;
@synthesize headerSelectedTextColor;

//ANImation Related
@synthesize animationSpeed;

//Bottom Slider Related Properties...
@synthesize bottomSliderH;
@synthesize models;


- (instancetype)init
{
    self = [super init];
    if (self) {
              //top slider configuration ...
              self.expandHeight                = 0.60;
              self.closedHeight                = 0.10;
              self.hMainSlider                 = closedHeight;
              self.headerSelectedTextColor     = [UIColor colorWithRed:197.0/255.0 green:48.0/255.0 blue:234.0/255.0 alpha:1.0];
              self.headerNormalTextColor       = [UIColor colorWithRed:215.0/255.0 green:215.0/255.0 blue:215.0/255.0 alpha:1.0];
        
              //animation speed control from single point ....
                self.animationSpeed              = 0.35;
        
        
              //Bottom related properties set up (optional)...
                self.bottomSliderH                      = SCREEN_HEIGHT - SCREEN_HEIGHT*self.closedHeight;
                self.selectedIndicatiorColor            = [UIColor blackColor];
                self.normalImageIndicatorColor          = [UIColor lightGrayColor];
                self.fontTitle                          = [UIFont boldSystemFontOfSize:SCREEN_WIDTH*0.055];
                self.fontTitleBig                          = [UIFont boldSystemFontOfSize:SCREEN_WIDTH*0.065];
        
        
        
        
                // fill detailed model bydefault
                models = [[NSMutableArray alloc]init];
        
                Model * m0  = [[Model alloc]initWithTitle:@"In Theators" andImages: [[NSMutableArray alloc]initWithObjects:
                                                                                    [UIImage imageNamed:@"b.png"],
                                                                                    [UIImage imageNamed:@"11.jpg"],
                                                                                    [UIImage imageNamed:@"22.jpg"],
                                                                                    [UIImage imageNamed:@"a.png"],
                                                                                    [UIImage imageNamed:@"11.jpg"],
                                                                                    [UIImage imageNamed:@"c.png"],nil]];
            [models addObject:m0];
        
            Model * m1 = [[Model alloc]initWithTitle:@"COMMING SOON" andImages: [[NSMutableArray alloc]initWithObjects:
                                                                                [UIImage imageNamed:@"00.jpg"],
                                                                                [UIImage imageNamed:@"b.png"],
                                                                                [UIImage imageNamed:@"22.jpg"], nil]];
            [models addObject:m1];
        
            Model * m2 = [[Model alloc]initWithTitle:@"TICKETS" andImages: [[NSMutableArray alloc]initWithObjects:
                                                                                [UIImage imageNamed:@"a.png"],
                                                                                [UIImage imageNamed:@"c.png"],
                                                                                [UIImage imageNamed:@"b.png"],
                                                                                [UIImage imageNamed:@"11.jpg"],
                                                                                [UIImage imageNamed:@"22.jpg"],nil]];
            [models addObject:m2];
        

        
    }
    return self;
}

@end
