//
//  ThirdViewController.m
//  Simsdemo
//
//  Created by Cybraum on 12/16/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = NSLocalizedString(@"", @"");
        NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIFont systemFontOfSize:10], NSFontAttributeName,
                                    [UIColor colorWithRed:(63/255.0) green:(147/255.0) blue:(195/255.0) alpha:1], NSForegroundColorAttributeName,
                                    nil];
        [self.tabBarItem setTitleTextAttributes:attributes forState:UIControlStateNormal];
        
        NSDictionary *attributes1 = [NSDictionary dictionaryWithObjectsAndKeys:
                                     [UIFont systemFontOfSize:10], NSFontAttributeName,
                                     [UIColor colorWithRed:(38/255.0) green:(38/255.0) blue:(38/255.0) alpha:1], NSForegroundColorAttributeName,
                                     nil];
        [self.tabBarItem setTitleTextAttributes:attributes1 forState:UIControlStateSelected];
        
        [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tab-bg.png"]];
        //[[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tab-selection.png"]];
        
        [self.tabBarItem setImage:[[UIImage imageNamed:@"explore@2x.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        [self.tabBarItem setSelectedImage:[[UIImage imageNamed:@"explore-black@2x.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
