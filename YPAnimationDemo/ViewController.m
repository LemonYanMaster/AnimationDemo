//
//  ViewController.m
//  YPAnimationDemo
//
//  Created by pengpeng yan on 16/3/21.
//  Copyright © 2016年 peng yan. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "Animations.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UITableView *AnimationTableView;
@property(nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation ViewController

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = @[@"Zoom in", @"Fade in",
        @"Fade out", @"Move down", @"Move up", @"Move left", @"Move right",
        @"Bounce down", @"Bounce up",@"Shadow Trapezoidal",
        @"Shadow Elliptical", @"Shadow Curl",@"Frame and Shadow", @"Rotate", @"Rotate and Fade in"];

    }
    return _dataArr;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"perfect.png"]];
    }
    return _imageView;
}

- (UITableView *)AnimationTableView{
    if (!_AnimationTableView) {
        _AnimationTableView = [[UITableView alloc] init];
//        _AnimationTableView.backgroundColor = [UIColor orangeColor];

        _AnimationTableView.dataSource = self;
        _AnimationTableView.delegate = self;
                //_AnimationTableView.rowHeight = 50;
    }
    return _AnimationTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.AnimationTableView];
    [self setUpConstains];
}

- (void)setUpConstains{
   [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(self.view.mas_top).offset(20);
       make.left.equalTo(self.view.mas_left).offset(40);
       make.right.equalTo(self.view.mas_right).offset(-40);
       make.height.equalTo(@100);
   }];
    [_AnimationTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageView.mas_bottom).offset(50);
        make.left.equalTo(self.view.mas_left).offset(1);
        make.right.equalTo(self.view.mas_right).offset(-1);
        make.bottom.equalTo(self.view.mas_bottom).offset(1);
    }];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return  self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.detailTextLabel.text = self.dataArr[indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *string = [[NSString alloc] initWithFormat:@"%@", self.dataArr[indexPath.row]];
    [self doAnimations:string];
}

- (void)doAnimations:(NSString *)string{
    if ([string isEqualToString:@"Zoom in"]) {
        [Animations zoomInView:self.imageView andAnimationDuration:1.0 andWait:NO];
    }
    if ([string isEqualToString:@"Fade in"]) {
        [Animations fadeInView:self.imageView andAnimationDuration:1.0 andWait:YES];
    }
    if ([string isEqualToString:@"Fade out"]) {
        [Animations fadeOutView:self.imageView andAnimationDuration:1.0 andWait:NO];
    }
    if ([string isEqualToString:@"Move down"]) {
        [Animations movedownView:self.imageView andAnimationDuration:1.0 Wait:NO andLength:60];
    }
    if ([string isEqualToString:@"Rotate"]) {
        [Animations rotateView:self.imageView andAnimationDuration:1.0 wait:NO andAngle:30];
    }
    if ([string isEqualToString:@"Rotate and Fade in"]) {
        [Animations rotateView:self.imageView andAnimationDuration:2.0 wait:YES andAngle:330];
        [Animations fadeInView:self.imageView andAnimationDuration:1.0 andWait:YES];
    }
}







@end
