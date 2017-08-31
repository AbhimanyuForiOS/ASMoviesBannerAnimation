//
//  Animator.m
//  AnimationDemo
//
//  Created by Abhimanyu  on 30/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

#import "Animator.h"

static  Animator * obj = nil;
@implementation Animator
@synthesize v;

+(Animator *)shared{
    if (obj == nil)
        obj =  [[Animator alloc]init];
    return obj;
}

-(void)setSwiperWithConfig:(AnimationConfiguration *)config OnView:(UIView *)view {
    
            self.v = view;
            self.config = [[AnimationConfiguration alloc]init];
    
   
            if (config != nil){
                self.config = config;
            }

    
            for (int i = 0; i<2; i++) {
               UISwipeGestureRecognizer * swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipe:)];
                if (i == 0)
                    swipe.direction = UISwipeGestureRecognizerDirectionUp;
                else
                    swipe.direction = UISwipeGestureRecognizerDirectionDown;
                [view addGestureRecognizer:swipe];
            }
    
    //set the view on main view
    [obj setUpMainColleactionOnView:view];
    
}


#pragma mark:- Animate entire  animation
-(void)handleSwipe:(UISwipeGestureRecognizer *)gesture{

    CGFloat val = 0;
    if (gesture.direction == UISwipeGestureRecognizerDirectionDown){
        NSLog(@"gesture going down");
        self.config.hMainSlider = SCREEN_HEIGHT*self.config.expandHeight;
        
        val = 0.5;

        
        
    }else{
        NSLog(@"gesture going up");
        val = 1.0;
        self.config.hMainSlider =  SCREEN_HEIGHT*self.config.closedHeight;
    
    }
    [self animateView:val];
}

-(void)animateView:(CGFloat)alpha {


    [UIView animateWithDuration:self.config.animationSpeed delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.hConstMainSlider.constant = self.config.hMainSlider;
        self.detailedSlider.collection.alpha = alpha;
        [self.mainSlider layoutIfNeeded];
        [self.v layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
    }];
    
  
    
    
    
    
    
    
}




@end
