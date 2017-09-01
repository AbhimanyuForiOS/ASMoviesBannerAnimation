//
//  DetailedSlider.m
//  AnimationDemo
//
//  Created by Abhimanyu  on 30/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

#import "DetailedSlider.h"

@implementation DetailedSlider


- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return  _images.count ;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        FXImageView *imageView      = [[FXImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width*0.80, [Animator shared].config.bottomSliderH-SCREEN_HEIGHT*0.20)];
        imageView.contentMode       = UIViewContentModeScaleAspectFill;
        imageView.asynchronous      = YES;
        imageView.reflectionScale   = 0.5f;
        imageView.backgroundColor   = [UIColor whiteColor];
        imageView.reflectionAlpha   = 0.0f;
        imageView.reflectionGap     = 10.0f;
        imageView.shadowOffset      = CGSizeMake(0.0f, 15.0f);
        imageView.shadowBlur        = SCREEN_WIDTH*0.10;
        imageView.cornerRadius      = 0.0f;
        imageView.userInteractionEnabled = true;
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame   = imageView.bounds;
        btn.tag  = index;
        [btn addTarget:self action:@selector(selectedItemtaped:) forControlEvents:UIControlEventTouchUpInside];
        [imageView addSubview:btn];
        view                        = imageView;
    }

    view.tag = index;
    
    //show placeholder
    ((FXImageView *)view).processedImage = [UIImage imageNamed:@"placeholder.png"];
    
    //set image
    ((FXImageView *)view).image =(UIImage *)[_images objectAtIndex:index];
    
    
    
    return view;
}

-(void)selectedItemtaped:(UIButton *)btn{

    Model * m           =   (Model *)[[Animator shared].config.models objectAtIndex:  [Animator shared].mainSlider.collection.currentItemIndex];
    //inform your vi
    [[Animator shared].delegate selectedModel:m andImg:(UIImage *)[_images objectAtIndex:btn.tag]];
    
}


- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    NSLog(@"subviews %@",  carousel.contentView.subviews);
        _pageControl.currentPage =  carousel.currentItemIndex;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionSpacing)
    {
        return value * 1.3;
    }
    return value;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



@end
