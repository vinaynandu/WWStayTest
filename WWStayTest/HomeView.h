//
//  HomeView.h
//  WWStayTest
//
//  Created by Vinay Nandyala on 28/12/14.
//  Copyright (c) 2014 Vinay Nandyala. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    eAddDetailsTag =10,
    eViewDetailsTag
    
}HomeViewTags;
@interface HomeView : UIView
@property(nonatomic,weak)id                          mRequestTarget;
- (id)initWithTarget:(id)inTarget;
-(void)createUIViewElements;
@end
