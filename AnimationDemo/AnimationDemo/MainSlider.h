//
//  MainSlider.h
//  AnimationDemo
//
//  Created by Abhimanyu  on 30/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainSlider : UIView<iCarouselDataSource, iCarouselDelegate>
@property(retain,nonatomic)UICollectionViewFlowLayout * layOut;
@property(retain,nonatomic)iCarousel * collection;
@property(retain,nonatomic)NSMutableArray * headerTitles;

@end
