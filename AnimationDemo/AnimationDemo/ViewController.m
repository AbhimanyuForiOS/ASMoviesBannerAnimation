//
//  ViewController.m
//  AnimationDemo
//
//  Created by Abhimanyu  on 30/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpAnimator];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)setUpAnimator{
    
                [[Animator shared]setSwiperWithConfig:[[AnimationConfiguration alloc]init] OnView:self.view];
                [Animator shared].delegate = self;
}

#pragma mark:- Animator delegate
-(void)selectedModel:(Model *)model andImg:(UIImage *)img{

 
    NSString * str = [NSString stringWithFormat:@"you selected an Movie from %@",model.titleHeader];
    
    UIAlertView * alrt = [[UIAlertView alloc]initWithTitle:@"As Indicator" message:str delegate:self cancelButtonTitle:nil otherButtonTitles:@"Okay", nil];
    [alrt show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
