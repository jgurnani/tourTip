//
//  JGTourTip.m
//The MIT License (MIT)
//
//Copyright (c) 2015 jgurnani
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

//

#import "JGTourTip.h"

@implementation JGTourTip
{
    UIView * baseViewForTourTip;
    NSArray * viewsForHighlights;
    NSArray * messageForHighlights;
    CGFloat paddingForHighlight;
    
    
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
    [self configureProperties];
    [self addBlackOverlayAndTourTipForView:[viewsForHighlights objectAtIndex:0] withMessage:[messageForHighlights objectAtIndex:0]];
}

-(void)configureProperties
{
    if(_paddingForHighlight != 0)
    {
        paddingForHighlight = _paddingForHighlight;
    }
    else
    {
        paddingForHighlight = 10;
    }
}

-(void)addBlackOverlayAndTourTipForView:(UIView *)viewToBeHighlighted withMessage:(NSString *)message
{
    CGRect viewBound = [viewToBeHighlighted.superview convertRect:viewToBeHighlighted.frame toView:baseViewForTourTip];
    
    blackOverlay = [[UIView alloc]initWithFrame:CGRectMake(-1000, -1000, 3000, 3000)];
    blackOverlay.backgroundColor = [UIColor blackColor];
    blackOverlay.alpha = 0.7;
    [baseViewForTourTip addSubview:blackOverlay];
    
    CGRect bounds = baseViewForTourTip.bounds;
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = bounds;
    maskLayer.fillColor = [UIColor blackColor].CGColor;
    
    CGRect const circleRect = CGRectMake(viewBound.origin.x -paddingForHighlight + 100, viewBound.origin.y - paddingForHighlight + 100, viewBound.size.width + (paddingForHighlight * 2), viewBound.size.height + (paddingForHighlight * 2));
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:circleRect];
    [path appendPath:[UIBezierPath bezierPathWithRect:blackOverlay.bounds]];
    maskLayer.path = path.CGPath;
    maskLayer.fillRule = kCAFillRuleEvenOdd;
    
    blackOverlay.layer.mask = maskLayer;
    
    
    
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
        _popUpView.topMargin = _paddingForHighlight;
        
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
