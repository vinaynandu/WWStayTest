//
//  ViewDetailsViewController.m
//  WWStayTest
//
//  Created by Vinay Nandyala on 29/12/14.
//  Copyright (c) 2014 Vinay Nandyala. All rights reserved.
//

#import "ViewDetailsViewController.h"
#import "ViewDetailsView.h"

@interface ViewDetailsViewController ()
{
    ViewDetailsView *mViewDetailsView;
}

@end

@implementation ViewDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Add Details";
    mViewDetailsView =[[ViewDetailsView alloc] initWithTarget:self];
    [mViewDetailsView createUIViewElements];
    
    self.view = mViewDetailsView;
    [self assignTextToLabels];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)assignTextToLabels
{
    NSString *plistPath = [self getPlistPath:@"ApartmentDetails.plist"];
    
    
    // get data from plist file
    NSMutableDictionary * plistDict = [[NSMutableDictionary alloc]
                                       initWithContentsOfFile:plistPath];
    
    UILabel *nameLbl = (UILabel*)[mViewDetailsView viewWithTag:eNameLblTag];
    UILabel *addressLbl = (UILabel*)[mViewDetailsView viewWithTag:eAddressLblTag];
    UILabel *cityLbl = (UILabel*)[mViewDetailsView viewWithTag:eCityLblTag];
    UILabel *stateLbl = (UILabel*)[mViewDetailsView viewWithTag:eStateLblTag];
    UILabel *countryLbl = (UILabel*)[mViewDetailsView viewWithTag:eCountryLblTag];
    UILabel *descriptionLbl = (UILabel*)[mViewDetailsView viewWithTag:eDescriptionLblTag];
    UILabel *amenitiesLbl = (UILabel*)[mViewDetailsView viewWithTag:eAmenitiesLblTag];
    UILabel *contactnameLbl = (UILabel*)[mViewDetailsView viewWithTag:eContactNameLblTag];
    UILabel *emailLbl = (UILabel*)[mViewDetailsView viewWithTag:eEmailLblTag];
    UILabel *phonenumLbl = (UILabel*)[mViewDetailsView viewWithTag:ePhoneNumLblTag];
    
    nameLbl.text = [plistDict objectForKey:@"NameKey"];
    addressLbl.text = [plistDict objectForKey:@"AddressKey"];
    cityLbl.text = [plistDict objectForKey:@"CityKey"];
    stateLbl.text = [plistDict objectForKey:@"StateKey"];
    countryLbl.text = [plistDict objectForKey:@"CountryKey"];
    descriptionLbl.text = [plistDict objectForKey:@"DescriptionKey"];
    amenitiesLbl.text = [plistDict objectForKey:@"AmenitiesKey"];
    contactnameLbl.text = [plistDict objectForKey:@"ContactNameKey"];
    emailLbl.text = [plistDict objectForKey:@"EmailKey"];
    phonenumLbl.text = [plistDict objectForKey:@"PhoneKey"];

    
}
- (NSString*)getPlistPath:(NSString*) filename{
    //Search for standard documents using NSSearchPathForDirectoriesInDomains
    //First Param = Searching the documents directory
    //Second Param = Searching the Users directory and not the System
    //Expand any tildes and identify home directories.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    return [documentsDir stringByAppendingPathComponent:filename];
}


@end
