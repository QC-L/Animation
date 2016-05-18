//
//  ViewController.m
//  AnimationTask
//
//  Created by 臧其龙 on 16/4/6.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "ViewController.h"

static NSString * const kCellID = @"kCellID";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray<NSString *> *animationNames;

@end

@implementation ViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.animationNames = @[@"ViewAnimation", @"LayerAnimation", @"TransitionAnimation", @"DynamicAnimation", @"ParticleAnimation"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView DataSource && Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.animationNames? self.animationNames.count:0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    cell.textLabel.text = self.animationNames[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   // TODO: Finish Click Action
    NSString *className = [self.animationNames[indexPath.row] stringByAppendingString:@"ViewController"];
    
    Class cls = NSClassFromString(className);
    if (cls) {
        UIViewController *vc = [[cls alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

@end
