//
//  AddDetailsViewController.h
//  WWStayTest
//
//  Created by Vinay Nandyala on 28/12/14.
//  Copyright (c) 2014 Vinay Nandyala. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddDetailsViewController : UIViewController<UIImagePickerControllerDelegate>
- (BOOL)validateEmailWithString:(NSString*)email;
- (NSString*)getPlistPath:(NSString*) filename;
@end
