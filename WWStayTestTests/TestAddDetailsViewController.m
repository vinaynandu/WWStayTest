//
//  TestAddDetailsViewController.m
//  WWStayTest
//
//  Created by Vinay Nandyala on 29/12/14.
//  Copyright (c) 2014 Vinay Nandyala. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AddDetailsViewController.h"
@interface TestAddDetailsViewController : XCTestCase
{
    AddDetailsViewController *mAddDetailsVC;
}

@end

@implementation TestAddDetailsViewController

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    mAddDetailsVC = [[AddDetailsViewController alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testPlistPathNil
{

    NSString *plistPath = [mAddDetailsVC getPlistPath:@"ApartmentDetails.plist"];
    XCTAssertNotNil(plistPath, @"Value is not Nil!");
}

-(void)testEmailValueinValid
{
    BOOL isValid = [mAddDetailsVC validateEmailWithString :@"asdbjald"];
    XCTAssertFalse(isValid, @"should be false");
}
-(void)testEmailValueValid
{
    BOOL isValid = [mAddDetailsVC validateEmailWithString :@"asdbjald@gmail.com"];
    XCTAssertTrue(isValid, @"is valid");
}


@end
