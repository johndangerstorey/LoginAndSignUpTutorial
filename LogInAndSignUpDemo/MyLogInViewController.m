//
//  MyLogInViewController.m
//  LogInAndSignUpDemo
//
//  Created by Mattieu Gamache-Asselin on 6/15/12.
//  Copyright (c) 2013 Parse. All rights reserved.
//
#import "MyLogInViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MyLogInViewController ()
@property (nonatomic, strong) UILabel *logoText;
@end

@implementation MyLogInViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.logInView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"MainBG.png"]]];
    
    
    // if 'nil' not selected it will bring up Parse Logo
    [self.logInView setLogo:[UIImage imageNamed:nil]];
    
    
    // sets logo font,size, and position - ? - I will need to use this for 3 other labels.  Do I define it in each place or is there a way to share it.  I started making a UIFont subclass but came accross difficulties because it makes you define the size each time you define the font.  The characteristics I want to persist is the NAME and the COLOR, but even those two are on completely different classes (being UIFont and UILabel)
    UILabel *logoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 40)];
    logoLabel.text = @"TWIZ";
    logoLabel.textColor = [UIColor whiteColor];
    logoLabel.textAlignment = NSTextAlignmentCenter;
    
    UIFont *museoTitleFont = [UIFont fontWithName:@"MuseoSansRounded-900" size:40.0];
    logoLabel.font = museoTitleFont;
    logoLabel.textAlignment = NSTextAlignmentCenter;
    [self.logInView addSubview:logoLabel];
    
    
    // tagline ^see above comment on repeating code
    
    
    UILabel *taglineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 240, self.view.bounds.size.width, 40)];
    taglineLabel.text = @"the twitter quiz game";
    taglineLabel.textColor = [UIColor whiteColor];
    taglineLabel.textAlignment = NSTextAlignmentCenter;
    
    UIFont *museoTagLineFont = [UIFont fontWithName:@"MuseoSansRounded-300" size:14.0];
    taglineLabel.font = museoTagLineFont;
    taglineLabel.textAlignment = NSTextAlignmentCenter;
    [self.logInView addSubview:taglineLabel];
    
    
    // twitter signup button - ? - How do I get this to do the same thing as the button below.  I tried looking for where self.logInView.twitterButton is located but couldn't find any clues.
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(twitterSignIn)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Login with Twitter" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIFont *museoButtonFont = [UIFont fontWithName:@"MuseoSansRounded-500" size:18.0];
    [button setFont:museoButtonFont];
    button.frame = CGRectMake(60.0, 287.0, 200.0, 40.0);
    [[button layer] setCornerRadius:5.0f];
    [[button layer] setBorderWidth:1.0f];
    [[button layer] setBorderColor:[UIColor whiteColor].CGColor];
    [self.view addSubview:button];
    
    
    // Alters button appearance for twitter button to be as close as possible to above
    
    
    [self.logInView.twitterButton setImage:nil forState:UIControlStateNormal];
    [self.logInView.twitterButton setImage:nil forState:UIControlStateHighlighted];
    [self.logInView.twitterButton setTitle:@"Login with Twitter" forState:UIControlStateNormal];
    [self.logInView.twitterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.logInView.twitterButton setTitle:@"" forState:UIControlStateNormal];
    [self.logInView.twitterButton setTitle:@"" forState:UIControlStateHighlighted];
    
}

-(BOOL) twitterSignIn {
    NSLog(@"You Clicked Sign In");
    return YES;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // Set frame for elements
    [self.logInView.twitterButton setFrame:CGRectMake(60.0f, 387.0f, 200.0f, 40.0f)];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
