//
//  AddDetailsView.m
//  WWStayTest
//
//  Created by Vinay Nandyala on 28/12/14.
//  Copyright (c) 2014 Vinay Nandyala. All rights reserved.
//

#import "AddDetailsView.h"

@implementation AddDetailsView


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
    CGRect applicationRect = [[UIScreen mainScreen] bounds] ;
    self.mScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 65, applicationRect.size.width, applicationRect.size.height-140)];
    self.mScrollView.backgroundColor = [UIColor grayColor];
    [self addSubview:self.mScrollView];
    // creating common labels
    UILabel *theNameLbl  = [self createLabelWithFrame:CGRectMake(10, 10, 100, 25) WithText:@"Name"];
    UILabel *theAddressLbl  = [self createLabelWithFrame:CGRectMake(10, theNameLbl.frame.size.height+theNameLbl.frame.origin.y+10, 100, 25) WithText:@"Address"];
    UILabel *theCityLbl  = [self createLabelWithFrame:CGRectMake(10, theAddressLbl.frame.size.height+theAddressLbl.frame.origin.y+10, 100, 25) WithText:@"City"];
    UILabel *theStateLbl  = [self createLabelWithFrame:CGRectMake(10, theCityLbl.frame.size.height+theCityLbl.frame.origin.y+10, 100, 25) WithText:@"State"];
    UILabel *theCountryLbl  = [self createLabelWithFrame:CGRectMake(10, theStateLbl.frame.size.height+theStateLbl.frame.origin.y+10, 100, 25) WithText:@"Country"];
    UILabel *theDescriptionLbl  = [self createLabelWithFrame:CGRectMake(10, theCountryLbl.frame.size.height+theCountryLbl.frame.origin.y+10, 100, 25) WithText:@"Description"];
    UILabel *theAmenitiesLbl  = [self createLabelWithFrame:CGRectMake(10, theDescriptionLbl.frame.size.height+theDescriptionLbl.frame.origin.y+10, 100, 25) WithText:@"Amenities"];
    UILabel *theContactNameLbl  = [self createLabelWithFrame:CGRectMake(10, theAmenitiesLbl.frame.size.height+theAmenitiesLbl.frame.origin.y+10, 120, 25) WithText:@"Contact Name"];
    UILabel *theEmailLbl  = [self createLabelWithFrame:CGRectMake(10, theContactNameLbl.frame.size.height+theContactNameLbl.frame.origin.y+10, 100, 25) WithText:@"Email"];
    UILabel *thePhoneNumLbl  = [self createLabelWithFrame:CGRectMake(10, theEmailLbl.frame.size.height+theEmailLbl.frame.origin.y+10, 120, 25) WithText:@"Phone Number"];
    

    [self.mScrollView addSubview:theNameLbl];
    [self.mScrollView addSubview:theAddressLbl];
    [self.mScrollView addSubview:theCityLbl];
    [self.mScrollView addSubview:theStateLbl];
    [self.mScrollView addSubview:theCountryLbl];
    [self.mScrollView addSubview:theDescriptionLbl];
    [self.mScrollView addSubview:theAmenitiesLbl];
    [self.mScrollView addSubview:theContactNameLbl];
    [self.mScrollView addSubview:theEmailLbl];
    [self.mScrollView addSubview:thePhoneNumLbl];

    //creating common textfields
    
    UITextField *theNameTxtFld = [self createTextfieldWithFrame:CGRectMake(theNameLbl.frame.origin.x+theNameLbl.frame.size.width+5, theNameLbl.frame.origin.y, 150, theNameLbl.frame.size.height) WithTag:eNameTxtTag WithPlaceHolder:@"Enter Apartment name"];
    UITextField *theAddressTxtFld = [self createTextfieldWithFrame:CGRectMake(theAddressLbl.frame.origin.x+theAddressLbl.frame.size.width+5, theAddressLbl.frame.origin.y, 150, theAddressLbl.frame.size.height) WithTag:eAddressTxtTag WithPlaceHolder:@"Enter Address"];
    UITextField *theCityTxtFld = [self createTextfieldWithFrame:CGRectMake(theCityLbl.frame.origin.x+theCityLbl.frame.size.width+5, theCityLbl.frame.origin.y, 150, theCityLbl.frame.size.height) WithTag:eCityTxtTag WithPlaceHolder:@"Enter City"];
    UITextField *theStateTxtFld = [self createTextfieldWithFrame:CGRectMake(theStateLbl.frame.origin.x+theStateLbl.frame.size.width+5, theStateLbl.frame.origin.y, 150, theStateLbl.frame.size.height) WithTag:eStateTxtTag WithPlaceHolder:@"Enter State"];
    UITextField *theCountryTxtFld = [self createTextfieldWithFrame:CGRectMake(theCountryLbl.frame.origin.x+theCountryLbl.frame.size.width+5, theCountryLbl.frame.origin.y, 150, theCountryLbl.frame.size.height) WithTag:eCountryTxtTag WithPlaceHolder:@"Enter Country"];
    UITextField *theDescriptionTxtFld = [self createTextfieldWithFrame:CGRectMake(theDescriptionLbl.frame.origin.x+theDescriptionLbl.frame.size.width+5, theDescriptionLbl.frame.origin.y, 150, theDescriptionLbl.frame.size.height) WithTag:eDescriptionTxtTag WithPlaceHolder:@"Enter Description"];
    UITextField *theAmenitiesTxtFld = [self createTextfieldWithFrame:CGRectMake(theAmenitiesLbl.frame.origin.x+theAmenitiesLbl.frame.size.width+5, theAmenitiesLbl.frame.origin.y, 150, theAmenitiesLbl.frame.size.height) WithTag:eAmenitiesTxtTag WithPlaceHolder:@"Enter Amenities"];
    UITextField *theContactNameTxtFld = [self createTextfieldWithFrame:CGRectMake(theContactNameLbl.frame.origin.x+theContactNameLbl.frame.size.width+5, theContactNameLbl.frame.origin.y, 150, theContactNameLbl.frame.size.height) WithTag:eContactNameTxtTag WithPlaceHolder:@"Enter ContactName"];
    UITextField *theEmailTxtFld = [self createTextfieldWithFrame:CGRectMake(theEmailLbl.frame.origin.x+theEmailLbl.frame.size.width+5, theEmailLbl.frame.origin.y, 150, theEmailLbl.frame.size.height) WithTag:eEmailTxtTag WithPlaceHolder:@"Enter Email"];
    theEmailTxtFld.keyboardType = UIKeyboardTypeEmailAddress;
    UITextField *thePhoneNumTxtFld = [self createTextfieldWithFrame:CGRectMake(thePhoneNumLbl.frame.origin.x+thePhoneNumLbl.frame.size.width+5, thePhoneNumLbl.frame.origin.y, 150, thePhoneNumLbl.frame.size.height) WithTag:ePhoneNumTxtTag WithPlaceHolder:@"Enter PhoneNumber"];
    thePhoneNumTxtFld.keyboardType = UIKeyboardTypePhonePad;

    [self.mScrollView addSubview:theNameTxtFld];
    [self.mScrollView addSubview:theAddressTxtFld];
    [self.mScrollView addSubview:theCityTxtFld];
    [self.mScrollView addSubview:theStateTxtFld];
    [self.mScrollView addSubview:theCountryTxtFld];
    [self.mScrollView addSubview:theDescriptionTxtFld];
    [self.mScrollView addSubview:theAmenitiesTxtFld];
    [self.mScrollView addSubview:theContactNameTxtFld];
    [self.mScrollView addSubview:theEmailTxtFld];
    [self.mScrollView addSubview:thePhoneNumTxtFld];
    
    
    self.mImageBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.mImageBtn1.frame = CGRectMake(10, thePhoneNumLbl.frame.origin.y+thePhoneNumLbl.frame.size.height+5, 100, 70);
    [self.mScrollView addSubview:self.mImageBtn1];
    [self.mImageBtn1 setTitle:@"Image1" forState:UIControlStateNormal];

    [self.mImageBtn1 addTarget:self.mRequestTarget action:@selector(addImageToButton1) forControlEvents:UIControlEventTouchUpInside];
    
    self.mImageBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.mImageBtn2.frame = CGRectMake(self.mImageBtn1.frame.origin.x+self.mImageBtn1.frame.size.width+10, thePhoneNumLbl.frame.origin.y+thePhoneNumLbl.frame.size.height+5, 100, 70);
    [self.mScrollView addSubview:self.mImageBtn2];
//    [self.mImageBtn1 setBackgroundColor:[UIColor greenColor]];
    [self.mImageBtn2 setTitle:@"Image2" forState:UIControlStateNormal];
    
    [self.mImageBtn2 addTarget:self.mRequestTarget action:@selector(addImageToBtn2) forControlEvents:UIControlEventTouchUpInside];
    UIButton *theSubmitBtn = [self createButtonWithRect:CGRectMake(10, applicationRect.size.height-70, 145, 50) WithTitle:@"Submit" WithTag:eSubmitBtnTag];
    [self addSubview:theSubmitBtn];
    
    UIButton *theCancelBtn = [self createButtonWithRect:CGRectMake(theSubmitBtn.frame.size.width+theSubmitBtn.frame.origin.x+10, applicationRect.size.height-70, 145, 50) WithTitle:@"Cancel" WithTag:eCancelBtnTag];
    [self addSubview:theCancelBtn];
    
    
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

/*
 * Method Name	: createLabelWithFrame
 * Description	: This method creates the Label
 * Parameters	: inFrame,InTitle
 * Return value	: UILabel
 */
-(UILabel*)createLabelWithFrame:(CGRect)inFrame WithText:(NSString*)inTitle
{
    UILabel *theCoomonLabel = [[UILabel alloc] initWithFrame:inFrame];
    theCoomonLabel.text = inTitle;
    theCoomonLabel.textColor = [UIColor blackColor];
    return theCoomonLabel;
}
-(UITextField*)createTextfieldWithFrame:(CGRect)inFrame WithTag:(NSInteger)inTag WithPlaceHolder:(NSString*)inPlaceholder
{
    UITextField *theCommonTextfld = [[UITextField alloc] initWithFrame:inFrame];
    theCommonTextfld.placeholder = inPlaceholder;
    theCommonTextfld.tag = inTag;
    theCommonTextfld.autocorrectionType = UITextAutocorrectionTypeNo;
    theCommonTextfld.delegate = self.mRequestTarget;
    return theCommonTextfld;
    
}


@end
