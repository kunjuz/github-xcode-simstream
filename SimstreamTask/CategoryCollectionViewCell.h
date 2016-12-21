//
//  CategoryCollectionViewCell.h
//  Simsdemo
//
//  Created by Cybraum on 12/16/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong)IBOutlet UILabel *nameLabel,*moneyLabel;
@property (nonatomic,strong)IBOutlet UIImageView *proctImageView;
@end
