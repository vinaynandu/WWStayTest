//
//  HomeViewController.m
//  WWStayTest
//
//  Created by Vinay Nandyala on 28/12/14.
//  Copyright (c) 2014 Vinay Nandyala. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeView.h"
#import "AddDetailsViewController.h"
#import "ViewDetailsViewController.h"
@interface HomeViewController ()
{
    HomeView *mHomeView;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Home";
    HomeView *theHomeView =[[HomeView alloc] initWithTarget:self];
    [theHomeView createUIViewElements];
    
    self.view = theHomeView;
    mHomeView = theHomeView;
    [self copyPlistFileToDocument];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
 * Method Name	: commonButtonClick:
 * Description	: This is the common method for all the button click action in the LoginScreen
 * Parameters	: inButton
 * Return value	: None
 */
- (void)CommonButtonClick:(UIButton*)inButton
{
    AppDelegate *theAppDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    switch (inButton.tag)
    {
        case eAddDetailsTag:
        {
            AddDetailsViewController *theDetailsViewController = [[AddDetailsViewController alloc]
                                                                  init];
            [theAppDelegate.mNavigationController pushViewController:theDetailsViewController animated:YES];
        }
            break;
        case eViewDetailsTag:
        {
            ViewDetailsViewController *theViewController = [[ViewDetailsViewController alloc]
                                                                  init];
            [theAppDelegate.mNavigationController pushViewController:theViewController animated:YES];
        }
            break;
        default:
        {
            
        }
            break;
    }
}
- (NSString*) getPlistPath:(NSString*) filename{
    //Search for standard documents using NSSearchPathForDirectoriesInDomains
    //First Param = Searching the documents directory
    //Second Param = Searching the Users directory and not the System
    //Expand any tildes and identify home directories.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    return [documentsDir stringByAppendingPathComponent:filename];
}
- (void) copyPlistFileToDocument{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSString *dbPath = [self getPlistPath:@"ApartmentDetails.plist"];
    if( ![fileManager fileExistsAtPath:dbPath])
    {
        NSString *defaultDBPath = [[NSBundle mainBundle] pathForResource:@"ApartmentDetails" ofType:@"plist"];
        BOOL copyResult = [fileManager copyItemAtPath:defaultDBPath toPath:dbPath error:&error];
        if(!copyResult)
            NSAssert1(0, @"Failed to create writable plist file with message '%@'.", [error localizedDescription]);
    }
    
}

@end
