//
//  Animator.h
//  AnimationDemo
//
//  Created by Abhimanyu  on 30/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//


#import <Foundation/Foundation.h>

#import "Animator.h"
#import <UIKit/UIKit.h>
#import "MainSlider.h"
#import "DetailedSlider.h"
#import "AnimationConfiguration.h"


@protocol AnimatorDelegate <NSObject>

-(void)selectedModel:(Model *)model andImg:(UIImage *)img;


@end

@interface Animator : NSObject
+(Animator *)shared;

@property(retain,nonatomic)id<AnimatorDelegate> delegate;

@property(strong,nonatomic)UIView               * v;

@property(strong,nonatomic)MainSlider               * mainSlider;
@property(retain,nonatomic)NSLayoutConstraint       * hConstMainSlider;

@property(strong,nonatomic)DetailedSlider           * detailedSlider;

@property(strong,nonatomic)AnimationConfiguration   * config;



-(void)setSwiperWithConfig:(AnimationConfiguration *)config OnView:(UIView *)view;



@end
