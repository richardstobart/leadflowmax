//
//  DetailViewController.m
//  leadflowmax
//
//  Created by Richard Stobart on 29/01/2016.
//  Copyright © 2016 Unboxed Consulting. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) IBOutlet UITextField *clientName;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (nonatomic) BOOL isEditable;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;

    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.clientName.text = [self.detailItem name];
    }
    self.clientName.enabled = NO;
    if (!self.detailItem.WFMid || [self.detailItem.WFMid isEqualToString:@""]){
        [self makeEditable: YES];
    }else {
        [self makeEditable: NO];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)edit:(UIBarButtonItem *)sender {
    [self makeEditable:!self.isEditable];
}

- (IBAction)clientName:(UITextField *)sender {
    self.detailItem.name = sender.text;
}

- (void) makeEditable:(BOOL )makeEditable {
    if (makeEditable){
        self.editButton.title = @"Done";
        self.clientName.enabled = YES;
        self.isEditable = YES;
    }else if (!makeEditable){
        self.editButton.title = @"Edit";
        self.clientName.enabled = NO;
        self.isEditable = NO;
    }
}


@end
