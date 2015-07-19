//
//  JGTourTip.h
//  holeOnAViewPOC
//
//  Created by Jay Gurnani on 19/07/15.
//  Copyright (c) 2015 Jay Gurnani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMPopTipView.h"

@interface JGTourTip : UIView <CMPopTipViewDelegate>
-(id)initWithViews:(NSArray *)viewArray withMessages:(NSArray *)messageArray onScreen:(UIView *)baseView;
-(void)showTourTip;


@property (nonatomic, strong) CMPopTipView * popUpView;

@end
