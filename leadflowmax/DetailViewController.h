//
//  DetailViewController.h
//  leadflowmax
//
//  Created by Richard Stobart on 29/01/2016.
//  Copyright © 2016 Unboxed Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

