//
//  ContentViewController.h
//  CKViewPager
//
//  Created by Cybraum on 12/21/16.
//  Copyright © 2016 Cybraum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentViewController : UIViewController
{
    IBOutlet UICollectionView *collectionCategoryView;
    NSArray *sortedArray;
}

@property NSString *labelString;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property(nonatomic,strong)NSArray *listingArray;

@end
