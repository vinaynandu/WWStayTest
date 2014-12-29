//
//  HomeView.m
//  WWStayTest
//
//  Created by Vinay Nandyala on 28/12/14.
//  Copyright (c) 2014 Vinay Nandyala. All rights reserved.
//

#import "HomeView.h"

@implementation HomeView

/*
 * Method Name	: initWithTarget
 * Description	: initialized with a target
 * Parameters	: none
 * Return value	: none
 */
- (id)initWithTarget:(id)inTarget
{
    self = [super init];
    if (self) {
        
        // Initialization code
        self.mRequestTarget      =   inTarget;
        self.backgroundColor = [UIColor whiteColor];

        
    }
    return self;
}
/*
 * Method Name	: createUIViewElements
 * Description	: This method creates the UI View Elements for HomeView
 * Parameters	: none
 * Return value	: none
 */
-(void)createUIViewElements
{
    UIButton *theAddApartmentDetailsBtn = [self createButtonWithRect:CGRectMake(10, 150, 300, 50) WithTitle:@"Add Apartment Details" WithTag:eAddDetailsTag];
    [self addSubview:theAddApartmentDetailsBtn];
    
    UIButton *theViewDetailsBtn = [self createButtonWithRect:CGRectMake(10, theAddApartmentDetailsBtn.frame.size.height+theAddApartmentDetailsBtn.frame.origin.y+15, 300, 50) WithTitle:@"View Apartment Details" WithTag:eViewDetailsTag];
    [self addSubview:theViewDetailsBtn];
    
    
}
/*
 * Method Name	: createButtonWithRect
 * Description	: This method creates the Button
 * Parameters	: inFrame,InTitle,inTag
 * Return value	: UIButton
 */
-(UIButton*)createButtonWithRect:(CGRect)inFrame WithTitle:(NSString*)inTitle WithTag:(NSInteger)inTag
{
    UIButton *commonBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    commonBtn.frame = inFrame;
    commonBtn.tag = inTag;
    [commonBtn setTitle:inTitle forState:UIControlStateNormal];
    [commonBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [commonBtn addTarget:self.mRequestTarget action:@selector(CommonButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    return commonBtn;
    
}
@end
