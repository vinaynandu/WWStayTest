//
//  AddDetailsView.h
//  WWStayTest
//
//  Created by Vinay Nandyala on 28/12/14.
//  Copyright (c) 2014 Vinay Nandyala. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    eSubmitBtnTag =10,
    eCancelBtnTag,
    eNameTxtTag,
    eAddressTxtTag,
    eCityTxtTag,
    eStateTxtTag,
    eCountryTxtTag,
    eDescriptionTxtTag,
    eAmenitiesTxtTag,
    eContactNameTxtTag,
    eEmailTxtTag,
    ePhoneNumTxtTag
    
}AddDetailsViewTags;
@interface AddDetailsView : UIView
@property(nonatomic,weak)id                          mRequestTarget;
@property(nonatomic,strong)UIScrollView *mScrollView;
@property(nonatomic,strong)UIButton *mImageBtn1;
@property(nonatomic,strong)UIButton *mImageBtn2;
- (id)initWithTarget:(id)inTarget;
-(void)createUIViewElements;
@end
