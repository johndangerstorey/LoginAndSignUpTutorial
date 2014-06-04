/*
 Copyright (c) 2012 Jesse Andersen. All rights reserved.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of
 this software and associated documentation files (the "Software"), to deal in
 the Software without restriction, including without limitation the rights to
 use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
 of the Software, and to permit persons to whom the Software is furnished to do
 so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 If you happen to meet one of the copyright holders in a bar you are obligated
 to buy them one pint of beer.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

#import "JACenterViewController.h"

#import "SubclassConfigViewController.h"
#import "MyLogInViewController.h"
#import "MyPlayViewController.h"

@interface JACenterViewController ()

@property (nonatomic, strong) IBOutlet UILabel *welcomeLabel;

@end

@implementation JACenterViewController

- (id)init {
    if (self = [super init]) {
        self.title = @"Play Twiz";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([PFUser currentUser]) {
        MyPlayViewController *playViewController = [MyPlayViewController new];
        [self presentViewController:playViewController animated:NO completion:NULL];
    } else {
        self.welcomeLabel.text = NSLocalizedString(@"You Need to Log in", nil);
    }
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"MainBG.png"]]];
    
    UILabel *userName = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, self.view.bounds.size.width, 40)];
    userName.text = [NSString stringWithFormat:NSLocalizedString(@"Welcome %@!", nil), [[PFUser currentUser] username]];
    
    [self.view addSubview:userName];

}

@end
