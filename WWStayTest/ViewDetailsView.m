//
//  ViewDetailsView.m
//  WWStayTest
//
//  Created by Vinay Nandyala on 29/12/14.
//  Copyright (c) 2014 Vinay Nandyala. All rights reserved.
//

#import "ViewDetailsView.h"

@implementation ViewDetailsView

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
    // creating common labels
    UILabel *theNameLbl  = [self createLabelWithFrame:CGRectMake(10, 70, 200, 25) WithText:@"Name" WithTag:eNameLblTag];
    UILabel *theAddressLbl  = [self createLabelWithFrame:CGRectMake(10, theNameLbl.frame.size.height+theNameLbl.frame.origin.y+10, 200, 25) WithText:@"Address" WithTag:eAddressLblTag];
    UILabel *theCityLbl  = [self createLabelWithFrame:CGRectMake(10, theAddressLbl.frame.size.height+theAddressLbl.frame.origin.y+10, 200, 25) WithText:@"City" WithTag:eCityLblTag];
    UILabel *theStateLbl  = [self createLabelWithFrame:CGRectMake(10, theCityLbl.frame.size.height+theCityLbl.frame.origin.y+10, 200, 25) WithText:@"State" WithTag:eStateLblTag];
    UILabel *theCountryLbl  = [self createLabelWithFrame:CGRectMake(10, theStateLbl.frame.size.height+theStateLbl.frame.origin.y+10, 200, 25) WithText:@"Country"WithTag:eCountryLblTag];

    UILabel *theDescriptionLbl  = [self createLabelWithFrame:CGRectMake(10, theCountryLbl.frame.size.height+theCountryLbl.frame.origin.y+10, 200, 25) WithText:@"Description" WithTag:eDescriptionLblTag];
    UILabel *theAmenitiesLbl  = [self createLabelWithFrame:CGRectMake(10, theDescriptionLbl.frame.size.height+theDescriptionLbl.frame.origin.y+10, 200, 25) WithText:@"Amenities" WithTag:eAmenitiesLblTag];
    UILabel *theContactNameLbl  = [self createLabelWithFrame:CGRectMake(10, theAmenitiesLbl.frame.size.height+theAmenitiesLbl.frame.origin.y+10, 200, 25) WithText:@"Contact Name" WithTag:eContactNameLblTag];
    UILabel *theEmailLbl  = [self createLabelWithFrame:CGRectMake(10, theContactNameLbl.frame.size.height+theContactNameLbl.frame.origin.y+10, 200, 25) WithText:@"Email" WithTag:eEmailLblTag];
    UILabel *thePhoneNumLbl  = [self createLabelWithFrame:CGRectMake(10, theEmailLbl.frame.size.height+theEmailLbl.frame.origin.y+10, 200, 25) WithText:@"Phone Number" WithTag:ePhoneNumLblTag];
    
    
    [self addSubview:theNameLbl];
    [self addSubview:theAddressLbl];
    [self addSubview:theCityLbl];
    [self addSubview:theStateLbl];
    [self addSubview:theCountryLbl];
    [self addSubview:theDescriptionLbl];
    [self addSubview:theAmenitiesLbl];
    [self addSubview:theContactNameLbl];
    [self addSubview:theEmailLbl];
    [self addSubview:thePhoneNumLbl];
    

    
    
    
}
/*
 * Method Name	: createLabelWithFrame
 * Description	: This method creates the Label
 * Parameters	: inFrame,InTitle
 * Return value	: UILabel
 */
-(UILabel*)createLabelWithFrame:(CGRect)inFrame WithText:(NSString*)inTitle WithTag:(NSInteger)inTag
{
    UILabel *theCoomonLabel = [[UILabel alloc] initWithFrame:inFrame];
    theCoomonLabel.text = inTitle;
    theCoomonLabel.textColor = [UIColor blackColor];
    theCoomonLabel.tag  = inTag;
    theCoomonLabel.textAlignment = NSTextAlignmentCenter;
    return theCoomonLabel;
}

@end
