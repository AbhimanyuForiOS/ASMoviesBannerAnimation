//
//  MainSlider.m
//  AnimationDemo
//
//  Created by Abhimanyu  on 30/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

#import "MainSlider.h"

@implementation MainSlider
@synthesize collection,layOut;
@synthesize headerTitles;

- (instancetype)init
{
    self = [super init];
    if (self) {
     //   headerTitles = [NSMuatb]
        
    }
    return self;
}

#pragma mark iCarousel methods




- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return [Animator shared].config.models.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    //create new view if no view is available for recycling
    if (view == nil)
    {
        FXImageView *imageView      = [[FXImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH*0.60, [Animator shared].config.hMainSlider*SCREEN_HEIGHT)];
        imageView.contentMode       = UIViewContentModeScaleAspectFit;
        imageView.asynchronous      = YES;
        imageView.reflectionScale   = 0.5f;
        imageView.backgroundColor   = [UIColor whiteColor];
        imageView.reflectionAlpha   = 0.25f;
        imageView.reflectionGap     = 10.0f;
        imageView.shadowOffset      = CGSizeMake(0.0f, 2.0f);
        imageView.shadowBlur        = 5.0f;
        imageView.cornerRadius      = 10.0f;
        
        Model * m           =   (Model *)[[Animator shared].config.models objectAtIndex:index];
        
        //title label
        UILabel * lbl       = [[UILabel alloc]init];
        lbl.frame           = CGRectMake(0, 0, imageView.bounds.size.width, imageView.bounds.size.height);
        lbl.tag             = 555;
        lbl.text            = m.titleHeader;
        
//        if ([Animator shared].config.hMainSlider == [Animator shared].config.expandHeight)
//            lbl.font            = [Animator shared].config.fontTitleBig;
//        else
             lbl.font            = [Animator shared].config.fontTitle;
        
        lbl.textAlignment   = NSTextAlignmentCenter;
        if (index == 0)
            lbl.textColor =  [Animator shared].config.headerSelectedTextColor;
        else
            lbl.textColor =  [Animator shared].config.headerNormalTextColor;
        
        lbl.backgroundColor = [UIColor clearColor];
        
        [imageView addSubview:lbl];

        
        view                        = imageView;
    }

    view.tag = index;
   
    
    //show placeholder
    ((FXImageView *)view).processedImage = [UIImage imageNamed:@"placeholder.png"];
    
    //set image
   //((FXImageView *)view).image = _images[index];
    return view;
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    //you need to reload carousel for update view of current index

     [self updateImagesToo];
    
    NSMutableArray * visibleItems = [[NSMutableArray alloc]initWithArray:carousel.visibleItemViews];
    
    
    NSLog(@"visibleItems %@",visibleItems);
    
    for (UIView * v in visibleItems) {
        NSLog(@"subviews %@",v.subviews);
        //change the view
        for (UIView * view in v.subviews) {
            NSLog(@"lbl %@",view);
            if ([view isKindOfClass:[UILabel class]]){
                UILabel * lbl       = (UILabel *)view;
                
                if (v == self.collection.currentItemView) {
                    lbl.textColor =  [Animator shared].config.headerSelectedTextColor;
                }else{
                    lbl.textColor =  [Animator shared].config.headerNormalTextColor;
                }
                
            }
        }
    }

}

-(void)carouselDidEndDecelerating:(iCarousel *)carousel{

    
    //update detail bottom slider to according to selection...
    [self updateImagesToo];
}

-(void)updateImagesToo{
    
    Model * m           =   (Model *)[[Animator shared].config.models objectAtIndex:  self.collection.currentItemIndex];
    
    [Animator shared].detailedSlider.images =  [[NSMutableArray alloc]initWithArray:m.images];
    
    [[Animator shared].detailedSlider.collection reloadData];
    [[Animator shared].detailedSlider.collection setContentOffset:CGSizeMake(0, 0)];
    [[Animator shared].detailedSlider.collection setScrollOffset:0];
    
    [Animator shared].detailedSlider.pageControl.currentPage = 0;
    [Animator shared].detailedSlider.pageControl.numberOfPages =   [Animator shared].detailedSlider.images.count;
    
}
-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    
    //update detail bottom slider to according to selection...
        [self updateImagesToo];

}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}






@end
