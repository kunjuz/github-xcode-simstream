//
//  ContentViewController.m
//  CKViewPager
//
//  Created by Cybraum on 12/21/16.
//  Copyright © 2016 Cybraum. All rights reserved.
//
//

#import "ContentViewController.h"
#import "CategoryCollectionViewCell.h"
#define CollectionHeight 330
#define CollectionHeightList 90
@interface ContentViewController ()

@end

@implementation ContentViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [collectionCategoryView setCollectionViewLayout:flowLayout];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;

    
   if( [[NSUserDefaults standardUserDefaults]objectForKey:@"change"]==nil)
   {
        [collectionCategoryView registerClass:[CategoryCollectionViewCell class] forCellWithReuseIdentifier:@"CategoryCollectionViewCell"];
         flowLayout.itemSize =CGSizeMake([UIScreen mainScreen].bounds.size.width/2,CollectionHeight);
   }
   else{
        [collectionCategoryView registerClass:[CategoryCollectionViewCell class] forCellWithReuseIdentifier:@"ListView"];
        flowLayout.itemSize =CGSizeMake([UIScreen mainScreen].bounds.size.width,CollectionHeightList);
   }
   
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [collectionCategoryView setCollectionViewLayout:flowLayout];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
     return [_listingArray count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CategoryCollectionViewCell *cell;
    
    if( [[NSUserDefaults standardUserDefaults]objectForKey:@"change"]==nil)
    {

    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CategoryCollectionViewCell" forIndexPath:indexPath];
    }
    else
    {
         cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ListView" forIndexPath:indexPath];
    }
  
    NSString  *displayimageUrl=[[_listingArray objectAtIndex:indexPath.row]objectForKey:@"displayImageUrl"];
    
       displayimageUrl = [displayimageUrl stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    cell.proctImageView.image=[UIImage imageNamed:@"Log-in-Bg.png"];
    
    cell.tag=indexPath.row;
    NSURL *url=[NSURL URLWithString:displayimageUrl];
    [self downloadImageWithURL:url completionBlock:^(BOOL succeeded, UIImage *image) {
        if (succeeded)
        {
            if(cell.tag == indexPath.row)
            {
                cell.proctImageView.image=image;
                [cell setNeedsLayout];
            }
        }
    }];

    cell.nameLabel.text=[[_listingArray objectAtIndex:indexPath.row]objectForKey:@"productName"];
    cell.moneyLabel.text=[[_listingArray objectAtIndex:indexPath.row]objectForKey:@"actualPrice"];
    
    cell.layer.borderWidth=0.50f;
    cell.layer.borderColor=[UIColor lightGrayColor].CGColor;
        return cell;
}



#pragma mark- Download Image from url

- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    NSMutableURLRequest *request1 = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request1
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     
     
     {
         if ( !error )
         {
             UIImage *image = [[UIImage alloc] initWithData:data];
             completionBlock(YES,image);
           
         }
         else{
             completionBlock(NO,nil);
             
         }
     }];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}
@end
