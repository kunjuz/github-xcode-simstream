//
//  HostViewController.m
//  CKViewPager
//
//  Created by Cybraum on 12/21/16.
//  Copyright © 2016 Cybraum. All rights reserved.
////
#import "HostViewController.h"
#import "ContentViewController.h"
#import "CategoryCollectionViewCell.h"
#import "Reachability.h"
@interface HostViewController () <ViewPagerDataSource, ViewPagerDelegate>

@property(nonatomic) NSUInteger numberOfTabs;

@property(nonatomic, strong) NSMutableArray * titlesLabels;
@end

@implementation HostViewController

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
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=YES;
    
}


- (void)viewDidLoad
{
	[super viewDidLoad];
    idArray=[[NSMutableArray alloc]init];
    cateNameArray=[[NSMutableArray alloc]init];
    productListArray=[[NSMutableArray alloc]init];

     [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"change"];
      AlphaClick=NO;
    count=0;
    
    iInt1=-1;
    titleArray=[NSArray arrayWithObjects:@"Deals",@"Mobiles", @"Laptops",@"Food",@"Electronics",@"Home Appliances",nil];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    if( networkStatus != NotReachable)
    {
        NSHTTPURLResponse *response = nil;
        NSString *jsonUrlString = [NSString stringWithFormat:@"http://burjalsafacomputers.com/demo/esmartshope/api/rest/dealscategory/0/AED/UAE"];
        NSURL *url = [NSURL URLWithString:[jsonUrlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        //-- Get request and response though URL
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
        
        //-- JSON Parsing
        NSMutableArray *result = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"Result = %@",result);
        
        arrayWithPlaces = [result valueForKey:@"DealsList"];
        // NSLog(@"%@",arrayWithPlaces);
        for(int i=0;i<[arrayWithPlaces count];i++)
        {
            NSString *catidStr=[[arrayWithPlaces objectAtIndex:i]objectForKey:@"catId"];
            NSString *catNameStr=[[arrayWithPlaces objectAtIndex:i]objectForKey:@"catName"];
            //  NSString *catiStr=[[arrayWithPlaces objectAtIndex:i]objectForKey:@"catId"];
            productListArray=[NSMutableArray arrayWithArray:[[arrayWithPlaces objectAtIndex:i]objectForKey:@"productList"]];
            
            [idArray addObject:catidStr];
            [cateNameArray addObject:catNameStr];
            
            //        NSLog(@"Result = %@",idArray);
            //        NSLog(@"Result = %@",productListArray);
            //        NSLog(@"Result = %@",cateNameArray);
            
        }
        self.dataSource = self;
        self.delegate = self;
        
        
        //self.title = @"View Pager";
        self.titlesLabels = [[NSMutableArray alloc] init];
        // Keeps tab bar below navigation bar on iOS 7.0+
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
            self.edgesForExtendedLayout = UIRectEdgeNone;
        }
        
        self.indicatorColor = [[UIColor redColor] colorWithAlphaComponent:1];
        self.tabsViewBackgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.32];
        self.contentViewBackgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.32];
        self.dividerColor = [UIColor blackColor];
        
        self.startFromSecondTab = NO;
        self.centerCurrentTab = NO;
        self.tabLocation = ViewPagerTabLocationTop;
        self.tabHeight = 49;
        self.tabOffset = 36;
        self.tabWidth = UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? 128.0f : 95;
        self.fixFormerTabsPositions = NO;
        self.fixLatterTabsPositions = NO;
        self.shouldShowDivider = YES;
        self.shouldAnimateIndicator = ViewPagerIndicatorAnimationWhileScrolling;
        
        self.numberOfTabs = [cateNameArray count];
    }
    else{
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Sorry!"
                                                          message:@"Check your  internet connection"
                                                         delegate:self
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [message show];
    }

    
   
}


- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];

	[self performSelector:@selector(loadContent) withObject:nil afterDelay:3.0];

    iInt1=0;
}


- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


#pragma mark - Setters


- (void)setNumberOfTabs:(NSUInteger)numberOfTabs
{

	// Set numberOfTabs
	_numberOfTabs = numberOfTabs;

	// Reload data
	[self reloadData];

}


#pragma mark - Helpers


- (void)selectTabWithNumberFive
{
	[self selectTabAtIndex:5];
}


- (void)loadContent
{
	self.numberOfTabs = [cateNameArray count];
    //self.numberOfTabs = [titleArray count];
}


#pragma mark - Interface Orientation Changes


- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{

	// Update changes after screen rotates
	[self performSelector:@selector(setNeedsReloadOptions) withObject:nil afterDelay:duration];
}


#pragma mark - ViewPagerDataSource


- (NSUInteger)numberOfTabsForViewPager:(ViewPagerController *)viewPager
{
	return self.numberOfTabs;
}


- (UIView *)viewPager:(ViewPagerController *)viewPager viewForTabAtIndex:(NSUInteger)index
{
	UILabel *label = [UILabel new];
    label.frame = CGRectMake(0,0,80,60);
	label.backgroundColor = [UIColor clearColor];
   //label.lineBreakMode = UILineBreakModeWordWrap;
    label.font = [UIFont systemFontOfSize:12.0];
    label.numberOfLines = 2;
    label.text =[cateNameArray objectAtIndex:index];
   // label.text =[titleArray objectAtIndex:index];
	label.textAlignment = NSTextAlignmentCenter;
	label.textColor = [UIColor blackColor];
	[label sizeToFit];

  [self.titlesLabels insertObject:label atIndex:index];

	return label;
}


- (UIViewController *)viewPager:(ViewPagerController *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index
{
   
    
    ContentViewController *cvc =[[ContentViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];

	cvc.labelString = [NSString stringWithFormat:@"Content View #%lu", (unsigned long)index];
  
    if(AlphaClick==NO)
    {
         cvc.listingArray=[[arrayWithPlaces objectAtIndex:index]objectForKey:@"productList"];
       
    }
   if(AlphaClick==YES)
   {
        cvc.listingArray=sortedArray;
       if(iInt1==(int)index)
       {
           AlphaClick=YES;
       }
       else
       {
       
        cvc.listingArray=[[arrayWithPlaces objectAtIndex:index]objectForKey:@"productList"];
          
       }
       
    }
    
    iInt1 = (int)index;
    
	return cvc;
}

- (void)viewPager:(ViewPagerController *)viewPager didChangeTabToIndex:(NSUInteger)index
{
     NSLog(@"index1 = %lu", (unsigned long)index);
    for (UILabel *label in self.titlesLabels)
 
    {
   
        label.textColor = [UIColor grayColor];
    
    }
    
  UILabel *label = self.titlesLabels[index];
  label.textColor = [UIColor grayColor];
 
}
- (void)viewPager:(ViewPagerController *)viewPager didChangeTabToIndex:(NSUInteger)index fromIndex:(NSUInteger)previousIndex didSwipe:(BOOL)didSwipe
{
    
    NSLog(@"index1 = %lu", (unsigned long)index);

    
}
-(IBAction)AlphaticallClick:(id)sender
{
    AlphaClick=YES;
    
    NSSortDescriptor *brandDescriptor = [[NSSortDescriptor alloc] initWithKey:@"productName" ascending:YES];
    NSArray*  sortDescriptors = [NSArray arrayWithObject:brandDescriptor];
    sortedArray = [[[arrayWithPlaces objectAtIndex:iInt1]objectForKey:@"productList"] sortedArrayUsingDescriptors:sortDescriptors];
    
    
    [self reloadData];
    
}
-(IBAction)GridListViewTap:(id)sender
{
    count++;
    
    if(count%2==0)
    {
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"change"];

        
    }
    else
    {
              [[NSUserDefaults standardUserDefaults]setObject:@"click" forKey:@"change"];

    }
   
       [self reloadData];
}


@end
