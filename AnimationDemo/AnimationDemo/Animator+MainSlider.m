//
//  Animator+MainSlider.m
//  AnimationDemo
//
//  Created by Abhimanyu  on 30/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

#import "Animator+MainSlider.h"

@implementation Animator (MainSlider)

-(void)setUpMainColleactionOnView:(UIView *)view{

    
    self.mainSlider  = [[ MainSlider alloc]init];
    self.mainSlider.backgroundColor =  [UIColor whiteColor];
    self.mainSlider.translatesAutoresizingMaskIntoConstraints = false;
    [view addSubview:self.mainSlider];
    
    
    NSLayoutConstraint *cX = [NSLayoutConstraint constraintWithItem:self.mainSlider attribute:NSLayoutAttributeCenterX
                                                              relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterX multiplier:1.0
                                                               constant:0];

    
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.mainSlider attribute:NSLayoutAttributeTop
                                                              relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1.0
                                                               constant:0];
    

    
    
    NSLayoutConstraint * width = [NSLayoutConstraint constraintWithItem:self.mainSlider attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeWidth multiplier:1.0
                                                            constant:0];
    
    self.hConstMainSlider = [NSLayoutConstraint constraintWithItem:self.mainSlider attribute:NSLayoutAttributeHeight
                                                              relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0
                                                               constant:SCREEN_HEIGHT*self.config.hMainSlider];
    
  
    
    [view addConstraints:@[cX,top,width,self.hConstMainSlider]];
    [self.mainSlider layoutIfNeeded];
    
    
     self.mainSlider.layOut = [[UICollectionViewFlowLayout alloc] init];
     self.mainSlider.layOut.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
     self.mainSlider.collection = [[iCarousel alloc]init];
    
     [self.mainSlider.collection  setDataSource:self.mainSlider];
     [self.mainSlider.collection  setDelegate:self.mainSlider];

    [self.mainSlider.collection setBackgroundColor:[UIColor whiteColor]];
    self.mainSlider.collection.translatesAutoresizingMaskIntoConstraints = false;
    [self.mainSlider addSubview:self.mainSlider.collection];
    
    
    
    NSLayoutConstraint *l = [NSLayoutConstraint constraintWithItem:self.mainSlider.collection  attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual toItem:self.mainSlider attribute:NSLayoutAttributeLeading multiplier:1.0
                                                           constant:0];
    
    
    NSLayoutConstraint *trail = [NSLayoutConstraint constraintWithItem:self.mainSlider.collection  attribute:NSLayoutAttributeTrailing
                                                         relatedBy:NSLayoutRelationEqual toItem:self.mainSlider attribute:NSLayoutAttributeTrailing multiplier:1.0
                                                          constant:0];
    NSLayoutConstraint * t = [NSLayoutConstraint constraintWithItem:self.mainSlider.collection  attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual toItem:self.mainSlider attribute:NSLayoutAttributeTop multiplier:1.0
                                                          constant:0];
    
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.mainSlider.collection  attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual toItem:self.mainSlider attribute:NSLayoutAttributeBottom multiplier:1.0
                                                          constant:0];
    [self.mainSlider addConstraints:@[l,trail,t,bottom]];
    [self.mainSlider.collection layoutIfNeeded];
 
    self.mainSlider.collection.type = iCarouselTypeSearchCell;
    self.mainSlider.collection.bounces = false;

    

    //set up detail view with lpictures data ....:)
    [self setUpDetailedColleactionOnView:view];
    

}
@end
