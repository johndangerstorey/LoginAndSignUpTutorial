//
//  SubclassConfigViewController.m
//  LogInAndSignUpDemo
//
//  Created by Mattieu Gamache-Asselin on 6/15/12.
//  Copyright (c) 2013 Parse. All rights reserved.
//

#import "MyCenterViewController.h"
#import "MyLogInViewController.h"
#import "MyPlayViewController.h"


@interface MyCenterViewController ()

- (void) refreshView;

@end

@implementation MyCenterViewController

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - UIViewController
- (void) viewWillAppear:(BOOL)animated{
    // initial screen here
    self.title = @"Twiz";
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"MainBG.png"]]];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Check if user is logged in
    if (![PFUser currentUser]) {        
        // Customize the Log In View Controller
        MyLogInViewController *logInViewController = [[MyLogInViewController alloc] init];
        logInViewController.modalTransitionStyle = UIModalTransitionStylePartialCurl;
        logInViewController.delegate = self;
        logInViewController.fields =   PFLogInFieldsTwitter;        // Present Log In View Controller
        [self presentViewController:logInViewController animated:YES completion:NULL];
    } else {
        // works only if you login, then close app and login, not after information is actually sent to twitter, then redirects you back up to top 'viewWillAppear' method
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"MainBG.png"]]];
        
        UILabel *userName = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, self.view.bounds.size.width, 40)];
        userName.text = [NSString stringWithFormat:NSLocalizedString(@"Welcome %@!", nil), [[PFUser currentUser] username]];
        
        [self.view addSubview:userName];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button addTarget:self
                   action:@selector(twitterLogOut)
         forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:@"Log Out" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        UIFont *museoButtonFont = [UIFont fontWithName:@"MuseoSansRounded-500" size:18.0];
        [button setFont:museoButtonFont];
        button.frame = CGRectMake(60.0, 287.0, 200.0, 40.0);
        [[button layer] setCornerRadius:5.0f];
        [[button layer] setBorderWidth:1.0f];
        [[button layer] setBorderColor:[UIColor whiteColor].CGColor];
        [self.view addSubview:button];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(refreshView)
                                                 name:@"LoginSuccessfulNotification"
                                               object:nil];

}

- (void) refreshView{
    NSLog(@"You want to refresh view");
    [self.view setNeedsDisplay];
}

- (void)twitterLogOut{
    NSLog(@"Log Out Clicked");
    [PFUser logOut];
    MyLogInViewController *logInViewController = [[MyLogInViewController alloc] init];
    logInViewController.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    logInViewController.delegate = self;
    logInViewController.fields =   PFLogInFieldsTwitter;
}

#pragma mark - PFLogInViewControllerDelegate

// Sent to the delegate to determine whether the log in request should be submitted to the server.
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    if (username && password && username.length && password.length) {
        return YES;
    }
    
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Make sure you fill out all of the information!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    return NO;
}

// Sent to the delegate when a PFUser is logged in.
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

// Sent to the delegate when the log in attempt fails.
- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"Failed to log in...");
}

// Sent to the delegate when the log in screen is dismissed.
- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    NSLog(@"User dismissed the logInViewController");
}


#pragma mark - PFSignUpViewControllerDelegate

// Sent to the delegate to determine whether the sign up request should be submitted to the server.
- (BOOL)signUpViewController:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info {
    BOOL informationComplete = YES;
    for (id key in info) {
        NSString *field = [info objectForKey:key];
        if (!field || field.length == 0) {
            informationComplete = NO;
            break;
        }
    }
    
    if (!informationComplete) {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Make sure you fill out all of the information!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    }
    
    return informationComplete;
}

// Sent to the delegate when a PFUser is signed up.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

// Sent to the delegate when the sign up attempt fails.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error {
    NSLog(@"Failed to sign up...");
}

// Sent to the delegate when the sign up screen is dismissed.
- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
    NSLog(@"User dismissed the signUpViewController");
}


#pragma mark - ()

- (IBAction)logOutButtonTapAction:(id)sender {
    [PFUser logOut];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
