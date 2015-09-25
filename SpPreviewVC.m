//
//  SpPreviewVC.m
//  Spliro
//
//  Created by Vikram Singh Charan on 20/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpPreviewVC.h"

@interface SpPreviewVC ()

@end

@implementation SpPreviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.previweScrollView.contentSize = CGSizeMake(320, 680);
    self.itemImage = [SpliroFunctionViewController getImageBgLayer:self.itemImage];
    self.userImage = [SpliroFunctionViewController getImageBgLayer:self.userImage];
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
- (IBAction)btnBackDidClicked:(id)sender {[self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)btnLocationDidClicked:(id)sender {
}

- (IBAction)btnSaveDidClicked:(id)sender
{

}
- (IBAction)btnDeleteDidClicked:(id)sender
{

}
- (IBAction)btnPostDidClicked:(id)sender
{

}
- (IBAction)btnViewReceiptDidClicked:(id)sender
{

}
- (IBAction)btnGroupShareDidClicked:(id)sender
{

}

@end
