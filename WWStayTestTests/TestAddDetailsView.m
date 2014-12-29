//
//  TestAddDetailsView.m
//  WWStayTest
//
//  Created by Vinay Nandyala on 29/12/14.
//  Copyright (c) 2014 Vinay Nandyala. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AddDetailsView.h"

@interface TestAddDetailsView : XCTestCase
{
    AddDetailsView *mAddDetailsView;

}

@end

@implementation TestAddDetailsView

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testTextFieldLength
{
    mAddDetailsView = [[AddDetailsView alloc] init];
    UITextField *nameTxtFld = (UITextField*)[mAddDetailsView viewWithTag:eNameTxtTag];
//    UITextField *addressTxtFld = (UITextField*)[mAddDetailsView viewWithTag:eAddressTxtTag];
//    UITextField *cityTxtFld = (UITextField*)[mAddDetailsView viewWithTag:eCityTxtTag];
//    UITextField *stateTxtFld = (UITextField*)[mAddDetailsView viewWithTag:eStateTxtTag];
//    UITextField *countryTxtFld = (UITextField*)[mAddDetailsView viewWithTag:eCountryTxtTag];
//    UITextField *descriptionTxtFld = (UITextField*)[mAddDetailsView viewWithTag:eDescriptionTxtTag];
//    UITextField *amenitiesTxtFld = (UITextField*)[mAddDetailsView viewWithTag:eAmenitiesTxtTag];
//    UITextField *contactnameTxtFld = (UITextField*)[mAddDetailsView viewWithTag:eContactNameTxtTag];
//    UITextField *emailTxtFld = (UITextField*)[mAddDetailsView viewWithTag:eEmailTxtTag];
    
    nameTxtFld.text = @"test";
    NSString *testUserName = nameTxtFld.text;
    XCTAssert((testUserName.length <= 40), @"UserName exceeds maximum limit!!");
}

@end
