//
//  HostViewController.h
//  CKViewPager
//
//  Created by Cybraum on 12/21/16.
//  Copyright © 2016 Cybraum. All rights reserved.
////

#import <QuartzCore/QuartzCore.h>

#import "ViewPagerController.h"

@interface HostViewController : ViewPagerController
{
    NSArray *titleArray;
    NSMutableArray *idArray,*cateNameArray,*productListArray;;
    NSArray *arrayWithPlaces,*sortedArray;
 
    int iInt1,currentindex,count;
    BOOL AlphaClick;
}
-(IBAction)AlphaticallClick:(id)sender;
-(IBAction)GridListViewTap:(id)sender;

@end
