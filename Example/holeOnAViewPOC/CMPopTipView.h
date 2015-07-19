//
//  JGTourTip.h
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



#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PointDirection) {
    PointDirectionAny = 0,
    PointDirectionUp,
    PointDirectionDown,
};

typedef NS_ENUM(NSInteger, CMPopTipAnimation) {
    CMPopTipAnimationSlide = 0,
    CMPopTipAnimationPop
};


@protocol CMPopTipViewDelegate;


@interface CMPopTipView : UIView

@property (nonatomic, strong)			UIColor					*backgroundColor;
@property (nonatomic, strong)				id<CMPopTipViewDelegate>	delegate;
@property (nonatomic, assign)			BOOL					disableTapToDismiss;
@property (nonatomic, assign)			BOOL					dismissTapAnywhere;
@property (nonatomic, strong)			NSString				*title;
@property (nonatomic, strong)			NSString				*message;
@property (nonatomic, strong)           UIView	                *customView;
@property (nonatomic, strong, readonly)	id						targetObject;
@property (nonatomic, strong)			UIColor					*titleColor;
@property (nonatomic, strong)			UIFont					*titleFont;
@property (nonatomic, strong)			UIColor					*textColor;
@property (nonatomic, strong)			UIFont					*textFont;
@property (nonatomic, assign)			NSTextAlignment			titleAlignment;
@property (nonatomic, assign)			NSTextAlignment			textAlignment;
@property (nonatomic, assign)           BOOL                    has3DStyle;
@property (nonatomic, strong)			UIColor					*borderColor;
@property (nonatomic, assign)           CGFloat                 cornerRadius;
@property (nonatomic, assign)			CGFloat					borderWidth;
@property (nonatomic, assign)           BOOL                    hasShadow;
@property (nonatomic, assign)           CMPopTipAnimation       animation;
@property (nonatomic, assign)           CGFloat                 maxWidth;
@property (nonatomic, assign)           PointDirection          preferredPointDirection;
@property (nonatomic, assign)           BOOL                    hasGradientBackground;
@property (nonatomic, assign)           CGFloat                 sidePadding;
@property (nonatomic, assign)           CGFloat                 topMargin;
@property (nonatomic, assign)           CGFloat                 pointerSize;
@property (nonatomic, assign)           CGFloat                 bubblePaddingX;
@property (nonatomic, assign)           CGFloat                 bubblePaddingY;

/* Contents can be either a message or a UIView */
- (id)initWithTitle:(NSString *)titleToShow message:(NSString *)messageToShow;
- (id)initWithMessage:(NSString *)messageToShow;
- (id)initWithCustomView:(UIView *)aView;

- (void)presentPointingAtView:(UIView *)targetView inView:(UIView *)containerView animated:(BOOL)animated;
- (void)presentPointingAtBarButtonItem:(UIBarButtonItem *)barButtonItem animated:(BOOL)animated;
- (void)dismissAnimated:(BOOL)animated;
- (void)autoDismissAnimated:(BOOL)animated atTimeInterval:(NSTimeInterval)timeInvertal;
- (PointDirection) getPointDirection;

@end


@protocol CMPopTipViewDelegate <NSObject>
- (void)popTipViewWasDismissedByUser:(CMPopTipView *)popTipView;
@end
