//
//  ViewDetailsView.h
//  WWStayTest
//
//  Created by Vinay Nandyala on 29/12/14.
//  Copyright (c) 2014 Vinay Nandyala. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{

    eNameLblTag =10,
    eAddressLblTag,
    eCityLblTag,
    eStateLblTag,
    eCountryLblTag,
    eDescriptionLblTag,
    eAmenitiesLblTag,
    eContactNameLblTag,
    eEmailLblTag,
    ePhoneNumLblTag
    
}AddDetailsViewTags;
@interface ViewDetailsView : UIView
@property(nonatomic,weak)id                          mRequestTarget;

- (id)initWithTarget:(id)inTarget;
-(void)createUIViewElements;
@end
