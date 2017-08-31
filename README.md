# ASMoviesBannerAnimation
Movie Banner
![movies](https://user-images.githubusercontent.com/7630897/29928768-53531c2a-8e87-11e7-94d8-507c61a19709.gif)


You can use this welcome or Home Screen Stylish Animation for your iOS Applications easily.


STEP 1 :-  Copy and past  PrefixHeader.pch  in your project from  "ASMoviesBannerAnimation" project and set your  path at project->Build Setting->Prefix Header

STEP 2:- Copy and Paste  everything from "Resources" & "Animatior" of   "ASMoviesBannerAnimation" project to your existing project.

![screen shot 2017-08-31 at 8 08 50 pm](https://user-images.githubusercontent.com/7630897/29929186-72e76f04-8e88-11e7-9609-48254529cc8c.png)

STEP 3:- go in your ViewController class where you want to implement it and Set AnimatorDelegate with ViewController.h file .
![screen shot 2017-08-31 at 8 18 24 pm](https://user-images.githubusercontent.com/7630897/29929428-2354fef6-8e89-11e7-9e42-0bd750f45162.png)

STEP 4:- Finally configure  your   ViewController.m  for final set up with few line of code.

#pragma mark:- View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[Animator shared]setSwiperWithConfig:[[AnimationConfiguration alloc]init] OnView:self.view];
    [Animator shared].delegate = self;
}
#pragma mark:- Animator delegate
-(void)selectedModel:(Model *)model andImg:(UIImage *)img{  
  
  NSString * str = [NSString stringWithFormat:@"you selected an Movie from %@",model.titleHeader];
    
    UIAlertView * alrt = [[UIAlertView alloc]initWithTitle:@"As Indicator" message:str delegate:self cancelButtonTitle:nil otherButtonTitles:@"Okay", nil];
    [alrt show];
}



