//
//  Model.m
//  AnimationDemo
//
//  Created by Abhimanyu  on 31/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

#import "Model.h"

@implementation Model
@synthesize titleHeader;
@synthesize images;

-(id)initWithTitle:(NSString *)title andImages:(NSMutableArray *)imagesArr{
    self.titleHeader = title;
    self.images      = imagesArr;
    return self;
}


@end
