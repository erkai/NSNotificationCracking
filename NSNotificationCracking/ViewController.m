//
//  ViewController.m
//  NSNotificationCracking
//
//  Created by kingyee on 2018/6/12.
//  Copyright © 2018年 kingyee. All rights reserved.
//

#import "ViewController.h"
#import "HHNotificationCenter.h"
#import "SecondViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    button.backgroundColor=[UIColor redColor];
    button.center=self.view.center;
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    [[HHNotificationCenter defaultCenter] addObserver:self selector:@selector(changeBackColor) name:@"kChangeColor" object:nil];
    
    
    
}
-(void)click
{
    SecondViewController *vc=[[SecondViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)changeBackColor
{
    self.view.backgroundColor=[UIColor yellowColor];
}
-(void)dealloc
{
    [[HHNotificationCenter defaultCenter]removeObserver:self name:@"kChangeColor" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
