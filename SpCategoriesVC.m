//
//  SpCategoriesVC.m
//  Spliro
//
//  Created by Vikram Singh Charan on 14/09/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpCategoriesVC.h"

@interface SpCategoriesVC ()

@end

@implementation SpCategoriesVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    HUD = [[MBProgressHUD alloc] init];
    [self.view addSubview:HUD];
    [HUD show:YES];
    
    [self callApi];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma MARK- uitableView delegate methods call
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        return [searchResult count];
    }
    else
    {
            return [categoryArray count];
    }

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    @try {
        static NSString *cellIdentifier = @"cell";
        
        UITableViewCell *cell = [categoryList_tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if(cell==nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        
        if (tableView == self.searchDisplayController.searchResultsTableView)
        {
            cell.textLabel.text = [searchResult objectAtIndex:indexPath.row];
        }
        else
        {
            if (self.save_cat_array.count == 0)
            {
                cell.textLabel.text = [[categoryArray objectAtIndex:indexPath.row]valueForKey:@"name"];
            }
            else
            {
                NSString *s =   [[categoryArray objectAtIndex:indexPath.row]valueForKey:@"category_id"];
                
                for (int k=0; k<self.save_cat_array.count; k++)
                {
                    NSString *b = [_save_cat_array objectAtIndex:k];
                    if ([s isEqualToString:b])
                    {
                        cell.accessoryType = UITableViewCellAccessoryCheckmark;
                        cell.textLabel.text = [[categoryArray objectAtIndex:indexPath.row]valueForKey:@"name"];
                        break;
                    }
                    else
                    {
                        cell.textLabel.text = [[categoryArray objectAtIndex:indexPath.row]valueForKey:@"name"];
                        cell.accessoryType = UITableViewCellAccessoryNone;
                    }
                }
                
            }
            
            
            //  cell.textLabel.text = [catArray objectAtIndex:indexPath.row];
        }
        return cell;
    }
    @catch (NSException *exception) {
        
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    @try {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        UITableViewCell  *cell = ( UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
        // int cat_id = [[categoryArray objectAtIndex:indexPath.row] valueForKey:@"category_id"];
        
        if (cell.accessoryType == UITableViewCellAccessoryNone)
        {
            [self.save_cat_array addObject:[[categoryArray objectAtIndex:indexPath.row] valueForKey:@"category_id"]];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        else
        {
            
            cell.accessoryType = UITableViewCellAccessoryNone;
            NSString *a = [NSString stringWithFormat:@"%@",[[categoryArray objectAtIndex:indexPath.row] valueForKey:@"category_id"]];
            [self removeSkill:a];
            //     [self.save_cat_array removeObjectAtIndex:indexPath.row];
        }

    }
    @catch (NSException *exception) {
        
    }
}
-(void)removeSkill:(NSString*)skill_Des{
    
    for (int i = 0; i < self.save_cat_array.count; i++) {
        NSString *sc = [self.save_cat_array objectAtIndex:i];
        if ([skill_Des isEqualToString:sc] )
        {
            [self.save_cat_array  removeObjectAtIndex:i];
        }
    }
}
#pragma mark - Search Method

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    [searchResult removeAllObjects];
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@", searchText];
    
    searchResult = [NSMutableArray arrayWithArray: [catArray filteredArrayUsingPredicate:resultPredicate]];
}
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = YES;
    return YES;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    @try
    {
        isSearch = YES;
        [searchResult removeAllObjects];
        
        [searchResult removeAllObjects];
        NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@", searchBar.text];
        searchResult = [NSMutableArray arrayWithArray: [catArray filteredArrayUsingPredicate:resultPredicate]];
        [categoryList_tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
    }
    @catch (NSException *exception)
    {
        
    }
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    isSearch = NO;
    searchBar.text = @"";
    [searchBar resignFirstResponder];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchBar.text.length == 0)
    {
        isSearch = NO;
        [categoryList_tableView reloadData];
    }
}
#pragma mark - Category Api calling
-(void)callApi
{
    @try {
        NSMutableDictionary *d = [[[Api_key alloc]init]registrationKeys];
        [d setValue:CATEGORY_LIST forKey:@"cmd"];
        NSNumber *num  = [NSNumber numberWithInteger:[[[NSUserDefaults standardUserDefaults] stringForKey:USER_ID] integerValue]];
        [d setValue:num forKey:USER_ID];
        
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary:d];
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
        NSString *jsonString;
        if (!jsonData)
        {
            NSLog(@"Got error ;%@",error);
        }
        else
        {
            jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
        
        NSString *urlSTR = [NSString stringWithFormat:@"%@?data=%@",Web_link,jsonString];
        
        urlSTR = [urlSTR stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *url = [NSURL URLWithString:urlSTR];
        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
         {
             if (!connectionError)
             {
                 NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                 if (NSSTRING_HAS_DATA([dic valueForKey:@"status"]))
                 {
                     if ([[dic valueForKey:@"status"] isEqualToString:STATUS_OK])
                     {
                         [HUD hide:YES];
                         categoryArray = [dic valueForKey:@"data"];
                         categoryList_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 116, 320, 300) style:UITableViewStylePlain];
                         categoryList_tableView.delegate =self;
                         categoryList_tableView.dataSource =self;
                         [self.view addSubview:categoryList_tableView];
                         categoryList_tableView.backgroundColor =[UIColor clearColor];
                         searchResult = [NSMutableArray arrayWithCapacity:[categoryArray count]];
                         
                         NSLog(@"dictioary %@",categoryArray);
                     }
                 }
             }
         }];
    }
    @catch (NSException *exception) {
        
    }
}
-(IBAction)btnBackDidClicked:(id)sender
{
    @try {
        if ([self.isselected isEqualToString:@"YES"])
        {
            [self.delegate returnData:self.save_cat_array];
            
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }

    }
    @catch (NSException *exception) {
        
    }
}
@end

