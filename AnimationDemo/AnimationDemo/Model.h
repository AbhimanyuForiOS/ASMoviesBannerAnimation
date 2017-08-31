//
//  Model.h
//  AnimationDemo
//
//  Created by Abhimanyu  on 31/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
@property(retain,nonatomic)NSString         * titleHeader;
@property(retain,nonatomic)NSMutableArray   * images;

-(id)initWithTitle:(NSString *)title andImages:(NSMutableArray *)imagesArr;

@end
