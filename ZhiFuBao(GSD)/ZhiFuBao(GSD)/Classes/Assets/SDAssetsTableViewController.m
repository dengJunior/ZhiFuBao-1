//
//  SDAssetsTableViewController.m
//  ZhiFuBao(GSD)
//
//  Created by iOS_Samboo on 16/1/29.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "SDAssetsTableViewController.h"
#import "SDAssetsTableViewControllerCell.h"
#import "SDAssetsTableViewControllerCellModel.h"
#import "SDAssetsTableViewHeader.h"
#import "SDYuEBaoTableViewController.h"

@implementation SDAssetsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.sectionsNumber = 3;
    self.cellClass = [SDAssetsTableViewControllerCell class];
    
    [self setupModel];
    
    SDAssetsTableViewHeader *header = [[SDAssetsTableViewHeader alloc] init];
    header.iconView.image = [UIImage imageNamed:@"tmall_icon"];
    self.tableView.tableHeaderView = header;
    
}

- (void)setupModel
{
    // section 0 的model
    SDAssetsTableViewControllerCellModel *model01 = [SDAssetsTableViewControllerCellModel modelWithTitle:@"余额宝" iconImageName:@"20000032Icon" destinationControllerClass:[SDYuEBaoTableViewController class]];

    SDAssetsTableViewControllerCellModel *model02 = [SDAssetsTableViewControllerCellModel modelWithTitle:@"招财宝" iconImageName:@"20000059Icon" destinationControllerClass:[SDBasicTableViewController class]];
    
    SDAssetsTableViewControllerCellModel *model03 = [SDAssetsTableViewControllerCellModel modelWithTitle:@"娱乐宝" iconImageName:@"20000077Icon" destinationControllerClass:[SDBasicTableViewController class]];
    
    // section 1 的model
    SDAssetsTableViewControllerCellModel *model11 = [SDAssetsTableViewControllerCellModel modelWithTitle:@"芝麻信用分" iconImageName:@"20000118Icon" destinationControllerClass:[SDBasicTableViewController class]];
    
    SDAssetsTableViewControllerCellModel *model12 = [SDAssetsTableViewControllerCellModel modelWithTitle:@"随身贷" iconImageName:@"20000180Icon" destinationControllerClass:[SDBasicTableViewController class]];
    
    SDAssetsTableViewControllerCellModel *model13 = [SDAssetsTableViewControllerCellModel modelWithTitle:@"我的保障" iconImageName:@"20000110Icon" destinationControllerClass:[SDBasicTableViewController class]];
    
    // section 2 的model
    SDAssetsTableViewControllerCellModel *model21 = [SDAssetsTableViewControllerCellModel modelWithTitle:@"爱心捐赠" iconImageName:@"09999978Icon" destinationControllerClass:[SDBasicTableViewController class]];

    self.dataArray = @[@[model01, model02, model03],
                       @[model11, model12, model13],
                       @[model21]
                       ];
}

#pragma mark - delegate 

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SDAssetsTableViewControllerCellModel *model = [self.dataArray[indexPath.section] objectAtIndex:indexPath.row];
    UIViewController *vc = [[model.destinationControllerClass alloc] init];
    vc.title = model.title;
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return (section == self.dataArray.count - 1) ? 10 : 0;
}

@end
