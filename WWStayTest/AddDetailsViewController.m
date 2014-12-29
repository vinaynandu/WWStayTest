//
//  AddDetailsViewController.m
//  WWStayTest
//
//  Created by Vinay Nandyala on 28/12/14.
//  Copyright (c) 2014 Vinay Nandyala. All rights reserved.
//

#import "AddDetailsViewController.h"
#import "AddDetailsView.h"

@interface AddDetailsViewController ()
{
    AddDetailsView *mDetailsView;
    BOOL keyboardIsShown;
    
}

@end

@implementation AddDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"Add Details";
    mDetailsView =[[AddDetailsView alloc] initWithTarget:self];
    [mDetailsView createUIViewElements];
    
    self.view = mDetailsView;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:self.view.window];
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:self.view.window];
    keyboardIsShown = NO;
    //make contentSize bigger than your scrollSize (you will need to figure out for your own use case)
    CGSize scrollContentSize = CGSizeMake(320, 380);
    mDetailsView.mScrollView.contentSize = scrollContentSize;
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
        case eSubmitBtnTag:
        {
            [self validateFields];
            [theAppDelegate.mNavigationController popViewControllerAnimated:YES];
            
        }
            break;
        case eCancelBtnTag:
        {
            [theAppDelegate.mNavigationController popViewControllerAnimated:YES];
        }
            break;
        default:
        {
            
        }
            break;
    }
}
- (void)keyboardWillHide:(NSNotification *)n
{
    NSDictionary* userInfo = [n userInfo];
    
    // get the size of the keyboard
    CGSize keyboardSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    
    // resize the scrollview
    CGRect viewFrame = mDetailsView.mScrollView.frame;
    // I'm also subtracting a constant kTabBarHeight because my UIScrollView was offset by the UITabBar so really only the portion of the keyboard that is leftover pass the UITabBar is obscuring my UIScrollView.
    viewFrame.size.height += (keyboardSize.height - 80);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [mDetailsView.mScrollView setFrame:viewFrame];
    [UIView commitAnimations];
    
    keyboardIsShown = NO;
}

- (void)keyboardWillShow:(NSNotification *)n
{
    // This is an ivar I'm using to ensure that we do not do the frame size adjustment on the `UIScrollView` if the keyboard is already shown.  This can happen if the user, after fixing editing a `UITextField`, scrolls the resized `UIScrollView` to another `UITextField` and attempts to edit the next `UITextField`.  If we were to resize the `UIScrollView` again, it would be disastrous.  NOTE: The keyboard notification will fire even when the keyboard is already shown.
    if (keyboardIsShown) {
        return;
    }
    
    NSDictionary* userInfo = [n userInfo];
    
    // get the size of the keyboard
    CGSize keyboardSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    // resize the noteView
    CGRect viewFrame = mDetailsView.mScrollView.frame;
    // I'm also subtracting a constant kTabBarHeight because my UIScrollView was offset by the UITabBar so really only the portion of the keyboard that is leftover pass the UITabBar is obscuring my UIScrollView.
    viewFrame.size.height -= (keyboardSize.height - 80);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [mDetailsView.mScrollView setFrame:viewFrame];
    [UIView commitAnimations];
    keyboardIsShown = YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    
    return YES;
}
-(void)validateFields
{
    
    
    UITextField *nameTxtFld = (UITextField*)[mDetailsView viewWithTag:eNameTxtTag];
    UITextField *addressTxtFld = (UITextField*)[mDetailsView viewWithTag:eAddressTxtTag];
    UITextField *cityTxtFld = (UITextField*)[mDetailsView viewWithTag:eCityTxtTag];
    UITextField *stateTxtFld = (UITextField*)[mDetailsView viewWithTag:eStateTxtTag];
    UITextField *countryTxtFld = (UITextField*)[mDetailsView viewWithTag:eCountryTxtTag];
    UITextField *descriptionTxtFld = (UITextField*)[mDetailsView viewWithTag:eDescriptionTxtTag];
    UITextField *amenitiesTxtFld = (UITextField*)[mDetailsView viewWithTag:eAmenitiesTxtTag];
    UITextField *contactnameTxtFld = (UITextField*)[mDetailsView viewWithTag:eContactNameTxtTag];
    UITextField *emailTxtFld = (UITextField*)[mDetailsView viewWithTag:eEmailTxtTag];
    UITextField *phonenumTxtFld = (UITextField*)[mDetailsView viewWithTag:ePhoneNumTxtTag];
    
    
    NSString *plistPath = [self getPlistPath:@"ApartmentDetails.plist"];
    
    
    // get data from plist file
    NSMutableDictionary * plistDict = [[NSMutableDictionary alloc]
                                       initWithContentsOfFile:plistPath];
    
    
    if([nameTxtFld.text length]>0 && [nameTxtFld.text length]<kTextFldMaxChar)
    {
        [plistDict setObject:nameTxtFld.text forKey:@"NameKey"];
        
    }
    if([addressTxtFld.text length]>0 &&[addressTxtFld.text length]<kTextFldMaxChar)
    {
        [plistDict setObject:addressTxtFld.text forKey:@"AddressKey"];
        
    }
    if([cityTxtFld.text length]>0 &&[cityTxtFld.text length]<kTextFldMaxChar)
    {
        [plistDict setObject:cityTxtFld.text forKey:@"CityKey"];
        
    }
    if([stateTxtFld.text length]>0 &&[stateTxtFld.text length]<kTextFldMaxChar)
    {
        [plistDict setObject:stateTxtFld.text forKey:@"StateKey"];
        
    }
    if([countryTxtFld.text length]>0 &&[countryTxtFld.text length]<kTextFldMaxChar)
    {
        [plistDict setObject:countryTxtFld.text forKey:@"CountryKey"];
        
    }
    if([descriptionTxtFld.text length]>0 &&[descriptionTxtFld.text length]<kTextFldMaxChar)
    {
        [plistDict setObject:descriptionTxtFld.text forKey:@"DescriptionKey"];
        
    }
    if([amenitiesTxtFld.text length]>0 &&[amenitiesTxtFld.text length]<kTextFldMaxChar)
    {
        [plistDict setObject:amenitiesTxtFld.text forKey:@"AmenitiesKey"];
        
    }
    if([contactnameTxtFld.text length]>0 &&[contactnameTxtFld.text length]<kTextFldMaxChar)
    {
        [plistDict setObject:contactnameTxtFld.text forKey:@"ContactNameKey"];
        
    }
    if([emailTxtFld.text length]>0 &&[self validateEmailWithString:emailTxtFld.text] &&[emailTxtFld.text length]<kTextFldMaxChar)
    {
        [plistDict setObject:emailTxtFld.text forKey:@"EmailKey"];
        
    }
    if([phonenumTxtFld.text length]>0 &&[phonenumTxtFld.text length]<kPhoneTextMaxChar)
    {
        [plistDict setObject:phonenumTxtFld.text forKey:@"PhoneKey"];
        
    }
    [plistDict writeToFile:plistPath atomically:YES];
    BOOL didWriteToFile = [plistDict writeToFile:plistPath atomically:YES];
    if(didWriteToFile)
    {
        NSLog(@"success");
    }
    else
    {
        NSLog(@"failure");
        
    }
    
    
    plistDict = nil;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    switch (textField.tag) {
        case eNameTxtTag:
        case eAddressTxtTag:
        case eCityTxtTag:
        case eStateTxtTag:
        case eCountryTxtTag:
        case eDescriptionTxtTag:
        case eAmenitiesTxtTag:
        case eContactNameTxtTag:
        case eEmailTxtTag:
        {
            if( [textField.text length] >kTextFldMaxChar && range.length == 0) // User name field should be max 128
            {
                return NO;
            }
        }
            break;
        case ePhoneNumTxtTag:
        {
            if( [textField.text length] >kPhoneTextMaxChar && range.length == 0) // Password  field should be max 14
            {
                return NO;
            }
        }
            break;
        default:
            return YES;
            break;
    }
    return YES;
    
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
- (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
-(void)addImageToButton1
{
    @try
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.delegate = self;
        
        [self presentViewController:picker animated:YES completion:nil];
    }
    @catch (NSException *exception)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Camera" message:@"Camera is not available  " delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}
-(void)addImageToBtn2
{
    @try
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.delegate = self;
        
        [self presentViewController:picker animated:YES completion:nil];
    }
    @catch (NSException *exception)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Camera" message:@"Camera is not available  " delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}

-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary*)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    [mDetailsView.mImageBtn1 setBackgroundImage:[info objectForKey:@"UIImagePickerControllerOriginalImage"] forState:UIControlStateNormal];
}
@end
