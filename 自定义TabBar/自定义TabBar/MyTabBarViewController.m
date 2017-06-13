//
//  MyTabBarViewController.m
//  自定义TabBar
//
//  Created by MS on 15-9-25.
//  Copyright (c) 2015年 栾高垒. All rights reserved.
//

#import "MyTabBarViewController.h"

@interface MyTabBarViewController ()<UIGestureRecognizerDelegate>{
    //用来存上一个label,vc和imageView
    UILabel *lab;
    UINavigationController *naC;
    UIImageView *imgV;
}

@end

@implementation MyTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //自定义tabBar必须要先隐藏tabBar上的子视图
    NSArray *arr = self.tabBar.subviews;
    for (UIView *view in arr) {
        view.hidden = YES;
    }
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //自定义tabBar
    [self createCustomTabBar];
}
//自定义tabBar
- (void)createCustomTabBar{
    NSArray *arr = @[@"菜谱", @"发现", @"广场", @"我的"];
    for (int i = 0; i < arr.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i * [UIScreen mainScreen].bounds.size.width / arr.count, 0, [UIScreen mainScreen].bounds.size.width / arr.count, 49)];
        if (i == 0) {
            imageView.backgroundColor = [UIColor orangeColor];
        }
        imageView.tag = 100 + i;
        //获取tabBar上的子视图
        UINavigationController *nav = self.viewControllers[i];
        imageView.image = nav.tabBarItem.image;
        imageView.userInteractionEnabled = YES;
        [self.tabBar addSubview:imageView];
        
        //加在imageView上的,所以坐标不用i控制
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((imageView.frame.size.width - 26)/2, 35, 26, 13)];
        label.text = arr[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:13.0];
        [imageView addSubview:label];
        
        if (i == 0) {
            imageView.image = nav.tabBarItem.selectedImage;
            label.textColor = [UIColor orangeColor];
            
            lab = label;
            imgV = imageView;
            naC = nav;
        }
        
        //图片点击事件
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        tap.delegate = self;
        [imageView addGestureRecognizer:tap];
    }
}
- (void)tap:(UITapGestureRecognizer *)tap{
    UIImageView *imageView = (UIImageView *)tap.view;
    if (imageView == imgV) {
        return;
    }
    //选中图片对应的子视图控制器
    UINavigationController *nav = self.viewControllers[imageView.tag - 100];
    imageView.image = nav.tabBarItem.selectedImage;
    UILabel *label = (UILabel *)[[imageView subviews] lastObject];
    label.textColor = [UIColor orangeColor];
    
    //上一个被点击的图片和文字还原
    imgV.image = naC.tabBarItem.image;
    lab.textColor = [UIColor blackColor];
    
    //重新给lab,imgV,naC赋值
    naC = nav;
    imgV = imageView;
    lab = label;
    
    self.selectedIndex = tap.view.tag - 100;
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

@end
