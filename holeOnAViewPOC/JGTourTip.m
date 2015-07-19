//
//  JGTourTip.m
//  holeOnAViewPOC
//
//  Created by Jay Gurnani on 19/07/15.
//  Copyright (c) 2015 Jay Gurnani. All rights reserved.
//

#import "JGTourTip.h"

@implementation JGTourTip
{
    UIView * baseViewForTourTip;
    NSArray * viewsForHighlights;
    NSArray * messageForHighlights;
    
    
    
    UIView * blackOverlay;
}

-(id)initWithViews:(NSArray *)viewArray withMessages:(NSArray *)messageArray onScreen:(UIView *)baseView
{
    self = [super init];
    if(self != nil)
    {
        baseViewForTourTip = baseView;
        viewsForHighlights = viewArray;
        messageForHighlights = messageArray;
    }
    return self;
}

-(void)showTourTip
{
    [self addBlackOverlayAndTourTipForView:[viewsForHighlights objectAtIndex:0] withMessage:[messageForHighlights objectAtIndex:0]];
}


-(void)addBlackOverlayAndTourTipForView:(UIView *)viewToBeHighlighted withMessage:(NSString *)message
{
    blackOverlay = [[UIView alloc]initWithFrame:CGRectMake(-1000, -1000, 3000, 3000)];
    blackOverlay.backgroundColor = [UIColor blackColor];
    blackOverlay.alpha = 0.7;
    [baseViewForTourTip addSubview:blackOverlay];
    
    CGRect bounds = baseViewForTourTip.bounds;
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = bounds;
    maskLayer.fillColor = [UIColor blackColor].CGColor;
    
    CGRect const circleRect = CGRectMake(viewToBeHighlighted.frame.origin.x -10 + 100, viewToBeHighlighted.frame.origin.y - 10 + 100, viewToBeHighlighted.frame.size.width + 20, viewToBeHighlighted.frame.size.height + 20);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:circleRect];
    [path appendPath:[UIBezierPath bezierPathWithRect:blackOverlay.bounds]];
    maskLayer.path = path.CGPath;
    maskLayer.fillRule = kCAFillRuleEvenOdd;
    
    blackOverlay.layer.mask = maskLayer;
    
    __weak typeof(self) weakSelf = self;
    
    
    //
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:15.0 options:UIViewAnimationOptionCurveLinear animations:^{
        blackOverlay.frame = CGRectMake(blackOverlay.frame.origin.x + 900 ,blackOverlay.frame.origin.y + 900 , blackOverlay.frame.size.width, blackOverlay.frame.size.height);
        
    } completion:^(BOOL finished) {

     
        _popUpView = [[CMPopTipView alloc]initWithMessage:message];
        _popUpView.has3DStyle = NO;
        _popUpView.backgroundColor = [UIColor colorWithRed:0 green:64.0/255.0 blue:84.0/255.0 alpha:1];
        _popUpView.borderWidth = 0.0;
        _popUpView.hasShadow = NO;
        _popUpView.dismissTapAnywhere = YES;
        _popUpView.delegate = self;
        [_popUpView presentPointingAtView:viewToBeHighlighted inView:baseViewForTourTip animated:YES];

        
    }];
    
}


-(void)popTipViewWasDismissedByUser:(CMPopTipView *)popTipView
{
    static int i = 0;
    [blackOverlay removeFromSuperview];
    i++;

    if(i < viewsForHighlights.count)
    {
        [self addBlackOverlayAndTourTipForView:[viewsForHighlights objectAtIndex:i] withMessage:[messageForHighlights objectAtIndex:i]];
    }

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
