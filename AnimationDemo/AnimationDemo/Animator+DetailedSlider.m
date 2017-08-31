//
//  Animator+DetailedSlider.m
//  AnimationDemo
//
//  Created by Abhimanyu  on 30/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

#import "Animator+DetailedSlider.h"

@implementation Animator (DetailedSlider)

-(void)setUpDetailedColleactionOnView:(UIView *)view{
 
    
    self.detailedSlider  = [[ DetailedSlider alloc]init];
    self.detailedSlider.backgroundColor =  [UIColor whiteColor];
    self.detailedSlider.translatesAutoresizingMaskIntoConstraints = false;
    [view addSubview:self.detailedSlider];
    
    
    NSLayoutConstraint *cX = [NSLayoutConstraint constraintWithItem:self.detailedSlider attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterX multiplier:1.0
                                                           constant:0];
    
    
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.detailedSlider attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual toItem:self.mainSlider attribute:NSLayoutAttributeBottom multiplier:1.0
                                                            constant:0];
    
    
    
    
    NSLayoutConstraint * width = [NSLayoutConstraint constraintWithItem:self.detailedSlider attribute:NSLayoutAttributeWidth
                                                              relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeWidth multiplier:1.0
                                                               constant:0];
    
    NSLayoutConstraint * h = [NSLayoutConstraint constraintWithItem:self.detailedSlider attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0
                                                          constant:self.config.bottomSliderH];
    
    
    
    [view addConstraints:@[cX,top,width,h]];
    
    [self.detailedSlider layoutIfNeeded];
    
    
    Model * m           =   (Model *)[[Animator shared].config.models objectAtIndex:  0];
    self.detailedSlider.images =  [[NSMutableArray alloc]initWithArray:m.images];
    
    
    self.detailedSlider.layOut = [[UICollectionViewFlowLayout alloc] init];
    self.detailedSlider.layOut.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.detailedSlider.collection = [[iCarousel alloc]init];
    
    [self.detailedSlider.collection  setDataSource:self.detailedSlider];
    [self.detailedSlider.collection  setDelegate:self.detailedSlider];
    
    //[self.mainSlider.collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [self.detailedSlider.collection setBackgroundColor:[UIColor whiteColor]];
    self.detailedSlider.collection.translatesAutoresizingMaskIntoConstraints = false;
    [self.detailedSlider addSubview:self.detailedSlider.collection];
    
    
    
    NSLayoutConstraint *l = [NSLayoutConstraint constraintWithItem:self.detailedSlider.collection  attribute:NSLayoutAttributeLeading
                                                         relatedBy:NSLayoutRelationEqual toItem:self.detailedSlider attribute:NSLayoutAttributeLeading multiplier:1.0
                                                          constant:0];
    
    
    NSLayoutConstraint *trail = [NSLayoutConstraint constraintWithItem:self.detailedSlider.collection  attribute:NSLayoutAttributeTrailing
                                                             relatedBy:NSLayoutRelationEqual toItem:self.detailedSlider attribute:NSLayoutAttributeTrailing multiplier:1.0
                                                              constant:0];
    NSLayoutConstraint * t = [NSLayoutConstraint constraintWithItem:self.detailedSlider.collection  attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual toItem:self.detailedSlider attribute:NSLayoutAttributeTop multiplier:1.0
                                                           constant:0];
    
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.detailedSlider.collection  attribute:NSLayoutAttributeBottom
                                                              relatedBy:NSLayoutRelationEqual toItem:self.detailedSlider attribute:NSLayoutAttributeBottom multiplier:1.0
                                                               constant:-SCREEN_HEIGHT*0.10];
    [self.detailedSlider addConstraints:@[l,trail,t,bottom]];
    [self.detailedSlider.collection layoutIfNeeded];
    
    self.detailedSlider.collection.type = iCarouselTypeSearchCell;
    self.detailedSlider.collection.bounces = false;
    self.detailedSlider.collection.pagingEnabled = YES;
    
    
    
    self.detailedSlider.pageControl = [[UIPageControl alloc] init];
    self.detailedSlider.pageControl.frame = CGRectMake(SCREEN_WIDTH/2 - (SCREEN_WIDTH/2)/2, self.detailedSlider.collection.bounds.size.height, SCREEN_WIDTH/2, 20);
    self.detailedSlider.pageControl.numberOfPages =  self.detailedSlider.images.count;
    self.detailedSlider.pageControl.currentPage = 0;
    self.detailedSlider.pageControl.backgroundColor =  [UIColor clearColor];
    self.detailedSlider.pageControl.currentPageIndicatorTintColor = self.config.selectedIndicatiorColor;
    self.detailedSlider.pageControl.pageIndicatorTintColor =  self.config.normalImageIndicatorColor;
    [self.detailedSlider addSubview:self.detailedSlider.pageControl];
    
    
     
    
    
    //title label find a movie
    UILabel * lbl       = [[UILabel alloc]init];
    lbl.frame           = CGRectMake(0,self.detailedSlider.bounds.size.height-SCREEN_WIDTH*0.07 , self.detailedSlider.bounds.size.width, SCREEN_WIDTH*0.07);
    lbl.text            = @"Find a movie";
    lbl.textAlignment   = NSTextAlignmentCenter;
    lbl.textColor =  [Animator shared].config.headerNormalTextColor;
    lbl.backgroundColor = [UIColor clearColor];
    [self.detailedSlider  addSubview:lbl];
    
    
}



@end
