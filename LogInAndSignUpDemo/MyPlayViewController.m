//
//  MyPlayViewController.m
//  LogInAndSignUpDemo
//
//  Created by John D. Storey on 5/30/14.
//
//

#import "MyPlayViewController.h"

#import "JASidePanelController.h"
#import "JALeftViewController.h"
#import "JARightViewController.h"

@interface MyPlayViewController ()

@property (nonatomic, strong) IBOutlet UILabel *userName;

@end



@implementation MyPlayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"MainBG.png"]]];
    
    UILabel *userName = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, self.view.bounds.size.width, 40)];
    userName.text = [NSString stringWithFormat:NSLocalizedString(@"Welcome %@!", nil), [[PFUser currentUser] username]];
    
    [self.view addSubview:userName];
    
    // NEXT need to initialize UILabel and then push it to view using this code:
//    self.welcomeLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Welcome %@!", nil), [[PFUser currentUser] username]];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
