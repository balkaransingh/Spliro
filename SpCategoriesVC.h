//
//  SpCategoriesVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 14/09/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Api_key.h"

@protocol SpCategoriesDelegate<NSObject>
-(void)returnData :(NSMutableArray *)listData;
@end


@interface SpCategoriesVC : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchDisplayDelegate,UISearchBarDelegate>
{
    NSMutableArray *categoryArray;
    NSArray *catArray;
    BOOL isSelected;
    NSMutableArray *searchResult;
    BOOL isSearch;
    MBProgressHUD *HUD;
    UILabel *resultLabel;
    UITableView *categoryList_tableView;
    NSMutableDictionary *dictionary,*dics;
}

@property (nonatomic,strong) id<SpCategoriesDelegate>delegate;
@property (nonatomic,strong) NSString * isselected;


@property (nonatomic, strong) NSMutableArray *save_cat_array;
 - (IBAction)btnBackDidClicked:(id)sender;
-(void)callApi;
@end
