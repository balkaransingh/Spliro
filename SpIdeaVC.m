//
//  SpIdeaVC.m
//  Spliro
//
//  Created by Vikram Singh Charan on 16/09/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpIdeaVC.h"

@interface SpIdeaVC ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation SpIdeaVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *path =[[NSBundle mainBundle]pathForResource:@"Our_Story" ofType:@"html"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:path]]];
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

- (IBAction)btnBackDidClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
