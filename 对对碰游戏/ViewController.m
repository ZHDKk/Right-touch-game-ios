//
//  ViewController.m
//  对对碰游戏
//
//  Created by zh dk on 2017/9/2.
//  Copyright © 2017年 zh dk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void) startGame
{
    //图像名字数组
    NSMutableArray *arrStr = [[NSMutableArray alloc] init];
    for (int k=0; k<28; k++) {
        int random = arc4random() %9 +1;
        NSString *strName = [NSString stringWithFormat:@"%d.png",random];
        //添加数组到数组中
        [arrStr addObject:strName];
        [arrStr addObject:strName];
    }
    //循环创建36个按钮
    for (int i=0; i<8; i++) {
        for (int j =0; j<7; j++) {
            //创建自定义按钮
            btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(160, 160, 50, 50);
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:3];
            //
            btn.frame = CGRectMake(10+50*j, 40+50*i, 50, 50);
            
            [UIView commitAnimations];
            
            //产生随机图片
            int indexrandom = arc4random() % arrStr.count;
            
            NSString *strImage = arrStr[indexrandom];
            NSInteger tag = [strImage integerValue];
            [arrStr removeObjectAtIndex:indexrandom];
            
             image = [UIImage imageNamed:strImage];
            [btn setImage:image forState:UIControlStateNormal];
//            [btn setBackgroundImage:[UIImage imageNamed:@"10.jpg"] forState:UIControlStateNormal];
            
            [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.view addSubview:btn];
            
           
            //将按钮标志位赋值
            btn.tag = tag;
        }
    }
    
    
    
}


-(void) pressBtn:(UIButton*)btn
{
    
    //创建一个静态变量保存第一次按下的按钮
    static UIButton *btnFirst;
    if (btnFirst == nil) {
        btnFirst = btn;
        //锁定第一个按钮
        btnFirst.enabled = NO;
    }else{
        //两个按钮图像相同
        if (btnFirst.tag == btn.tag) {
            btnFirst.hidden = YES;
            btn.hidden = YES;
            btnFirst = nil;
        }else{
            //两个按钮不同
            btnFirst.enabled = YES;
            btnFirst = nil;
        }
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self startGame];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
