//
//  ViewController.m
//  holeOnAViewPOC
//
//  Created by Jay Gurnani on 18/07/15.
//  Copyright (c) 2015 Jay Gurnani. All rights reserved.
//

#import "ViewController.h"
#import "CMPopTipView.h"
#import "JGTourTip.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *buttonToHighlight;

@property (strong, nonatomic) IBOutlet UIButton *centerPressButton;

@property (strong, nonatomic) IBOutlet UIButton *bottomLeftButton;
@property (strong, nonatomic) IBOutlet UIButton *insertedNewButton;

@end

@implementation ViewController
{
   // UIView * blackOverlay;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    NSArray * viewArray = [[NSArray alloc]initWithObjects:_buttonToHighlight,_centerPressButton,_insertedNewButton,_bottomLeftButton, nil];
    
    NSArray * messageArray = [[NSArray alloc]initWithObjects:@"This is demo message for top right button",@"This is demo message for center button",@"Wow Here's the new button. It seems awesome to use !!!",@"This is demo button for bottom left button", nil];
    
    JGTourTip * tourTip = [[JGTourTip alloc]initWithViews:viewArray withMessages:messageArray onScreen:self.view];
    [tourTip showTourTip];
    

}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressButton:(id)sender {
    
    //[self addBlackOverlayAndTourTipForView:_buttonToHighlight withMessage:@"Hello this is demo message"];
//    [JGTourTip addBlackOverlayAndTourTipForView:_buttonToHighlight withMessage:@"Hello this is demo message" onView:self.view];
//    blackOverlay = [[UIView alloc]initWithFrame:CGRectMake(-1000, -1000, 3000, 3000)];
//    blackOverlay.backgroundColor = [UIColor blackColor];
//    blackOverlay.alpha = 0.6;
//    [self.view addSubview:blackOverlay];
//    
//    CGRect bounds = self.view.bounds;
//    CAShapeLayer *maskLayer = [CAShapeLayer layer];
//    maskLayer.frame = bounds;
//    maskLayer.fillColor = [UIColor blackColor].CGColor;
//    
//    static CGFloat const kRadius = 100;
//    UIButton * button = sender;
//    CGRect const circleRect = CGRectMake(button.frame.origin.x -10 + 100, button.frame.origin.y - 10 + 100, button.frame.size.width + 20, button.frame.size.height + 20);
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:circleRect];
//    [path appendPath:[UIBezierPath bezierPathWithRect:blackOverlay.bounds]];
//    maskLayer.path = path.CGPath;
//    maskLayer.fillRule = kCAFillRuleEvenOdd;
//    
//    blackOverlay.layer.mask = maskLayer;
////    
//    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:10.0 options:UIViewAnimationOptionCurveLinear animations:^{
//        blackOverlay.frame = CGRectMake(blackOverlay.frame.origin.x + 900 ,blackOverlay.frame.origin.y + 900 , blackOverlay.frame.size.width, blackOverlay.frame.size.height);
//        
//    } completion:^(BOOL finished) {
//        
//    }];
    
//    [UIView animateWithDuration:1.0 animations:^{
//        blackOverlay.frame = CGRectMake(blackOverlay.frame.origin.x + 1000 ,blackOverlay.frame.origin.y + 1000 , blackOverlay.frame.size.width, blackOverlay.frame.size.height);
//    } completion:^(BOOL finished) {
//        
//    }];
    
//    UIDynamicAnimator * animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
//    
//    UISnapBehavior * snapBehaviour = [[ UISnapBehavior alloc]initWithItem:blackOverlay snapToPoint:CGPointMake(blackOverlay.center.x + 900, blackOverlay.center.y + 900)];
//    
//    [animator addBehavior:snapBehaviour];
    
}

-(void)addBlackOverlayAndTourTipForView:(UIView *)viewToBeHighlighted withMessage:(NSString *)message
{
    UIView * blackOverlay = [[UIView alloc]initWithFrame:CGRectMake(-1000, -1000, 3000, 3000)];
    blackOverlay.backgroundColor = [UIColor blackColor];
    blackOverlay.alpha = 0.6;
    [self.view addSubview:blackOverlay];
    
    CGRect bounds = self.view.bounds;
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = bounds;
    maskLayer.fillColor = [UIColor blackColor].CGColor;
    
    CGRect const circleRect = CGRectMake(viewToBeHighlighted.frame.origin.x -10 + 100, viewToBeHighlighted.frame.origin.y - 10 + 100, viewToBeHighlighted.frame.size.width + 20, viewToBeHighlighted.frame.size.height + 20);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:circleRect];
    [path appendPath:[UIBezierPath bezierPathWithRect:blackOverlay.bounds]];
    maskLayer.path = path.CGPath;
    maskLayer.fillRule = kCAFillRuleEvenOdd;
    
    blackOverlay.layer.mask = maskLayer;
    //
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:15.0 options:UIViewAnimationOptionCurveLinear animations:^{
        blackOverlay.frame = CGRectMake(blackOverlay.frame.origin.x + 900 ,blackOverlay.frame.origin.y + 900 , blackOverlay.frame.size.width, blackOverlay.frame.size.height);
        
    } completion:^(BOOL finished) {
        CMPopTipView * popUpView = [[CMPopTipView alloc]initWithMessage:message];
        popUpView.has3DStyle = NO;
        popUpView.backgroundColor = [UIColor colorWithRed:0 green:64.0/255.0 blue:84.0/255.0 alpha:1];
        popUpView.borderWidth = 0.0;
        popUpView.hasShadow = NO;
        [popUpView presentPointingAtView:viewToBeHighlighted inView:self.view animated:YES];
    
        
        
    }];
}

@end
