//
//  CategoryCollectionViewCell.m
//  Simsdemo
//
//  Created by Cybraum on 12/16/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "CategoryCollectionViewCell.h"

@implementation CategoryCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
        NSArray * arrayOfViews ;
        
        if( [[NSUserDefaults standardUserDefaults]objectForKey:@"change"]==nil)
        {
            arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"CategoryCollectionViewCell" owner:self options:nil];
        }
        else
        {
             arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"ListView" owner:self options:nil];
        }
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        
        self = [arrayOfViews objectAtIndex:0];
        
    }
    
    
    return self;
    
}

@end
