//
//  ViewController.m
//  猎聘同道
//
//  Created by 郭朝顺 on 2018/6/11星期一.
//  Copyright © 2018年 乐乐. All rights reserved.
//

#import "ViewController.h"
#import "SelectView.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) NSArray <UIImageView *>* bgImageView ;
@property (strong, nonatomic)  UIScrollView *scrollView;
@property (nonatomic,strong) SelectView * selectView ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor] ;
    
    for (UIImageView * temp in self.bgImageView) {
        [self.view addSubview:temp] ;
    }
    
    self.bgImageView[0].alpha = 1 ;
    self.selectView.lineArray[0].alpha = 1 ;
    
    [self.view addSubview:self.scrollView] ;
    
    [self.view addSubview:self.selectView];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    [self changeBgImageView:scrollView.contentOffset.x];
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    CGFloat x = scrollView.contentOffset.x ;
    CGFloat width = self.view.frame.size.width ;
    [self.selectView setSelectedIndex:x/width +1];
    
}


- (void)changeBgImageView:(CGFloat)x {

    
    for (UIImageView * temp in self.bgImageView) {
        temp.alpha = 0 ;
    }
    
    for (UILabel * temp in self.selectView.lineArray) {
        temp.alpha = 0 ;
    }
    
    CGFloat width = self.view.frame.size.width ;
    NSLog(@"%lf",x) ;
    
    // 这块其实应该给SelectView抽一个方法,在这个方法里改lineArray的alpha,但是由于只是小demo,而且这个alpha和bgImageView一致,就懒得处理了
    if (x<=width) {
        
        self.selectView.lineArray[0].alpha = self.bgImageView[0].alpha =  (width-x)/width ;
        self.selectView.lineArray[1].alpha = self.bgImageView[1].alpha = x / width ;
        
        
        
    } else if (x<=width*2 && x>width) {
        
        self.selectView.lineArray[1].alpha = self.bgImageView[1].alpha = (width*2-x)/width ;
        self.selectView.lineArray[2].alpha = self.bgImageView[2].alpha = (x-width) / width ;
    } else if (x<=width*3 && x>width*2) {
        self.selectView.lineArray[2].alpha = self.bgImageView[2].alpha = (width*3-x)/width ;
        self.selectView.lineArray[3].alpha = self.bgImageView[3].alpha = (x-width*2) / width ;
    } else if (x<=width*4 && x>width*3) {
        self.selectView.lineArray[2].alpha = self.bgImageView[2].alpha = (width*4-x)/width ;
        self.selectView.lineArray[3].alpha = self.bgImageView[3].alpha = (x-width*3) / width ;
    }
    
    
    
}


- (UIScrollView *)scrollView {
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _scrollView.contentSize = CGSizeMake(self.view.frame.size.width*4, 0);
        _scrollView.delegate = self ;
        _scrollView.pagingEnabled = YES ;
        _scrollView.bounces = NO ;
        _scrollView.showsHorizontalScrollIndicator = NO ;
        NSArray * imageName = @[@"1",@"2",@"3",@"4"] ;

        CGFloat width = self.view.frame.size.width ;
        NSValue * v1 = [NSValue valueWithCGRect:CGRectMake(38, 53, 347, 469)];
        NSValue * v2 = [NSValue valueWithCGRect:CGRectMake(width+64, 76, 357, 369)];
        NSValue * v3 = [NSValue valueWithCGRect:CGRectMake(width*2+123, 103, 237, 453)];
        NSValue * v4 = [NSValue valueWithCGRect:CGRectMake(width*3+51, 27, 219, 436)];
        NSArray * rect = @[v1,v2,v3,v4];
        
        for (int i = 0; i<4; i++) {
            UIImageView * image = [[UIImageView alloc] initWithFrame: [rect[i] CGRectValue] ];
            
            
            image.backgroundColor = [UIColor clearColor];
            image.contentMode = UIViewContentModeScaleAspectFit ;
            image.image = [UIImage imageNamed:imageName[i] ];
            
            [_scrollView addSubview:image];
            
            if (i==3) {
                UIButton * login = [[UIButton alloc] initWithFrame:CGRectMake(width * 3 + self.view.center.x-90/2, 517, 90, 30)];
                login.layer.cornerRadius = 5;
                login.clipsToBounds = YES ;
                [login addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside ];
                [login setTitle:@"登录" forState:UIControlStateNormal];
                [login setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                login.backgroundColor = [UIColor colorWithRed:61/255.0 green:123/255.0 blue:248/255.0 alpha:1/1.0];
                [_scrollView addSubview:login];
            }
            
        }
        
    }
    return _scrollView;
}
- (SelectView *)selectView {
    if (_selectView == nil) {
        _selectView = [[NSBundle mainBundle] loadNibNamed:@"SelectView" owner:nil options:nil].firstObject;
        _selectView.frame = CGRectMake(0, 0, 207, 54) ;
        _selectView.center = CGPointMake(self.view.frame.size.width - 100 , self.view.frame.size.height - 30 );
    }
    return _selectView ;
}

- (NSArray<UIImageView *> *)bgImageView {
    
    if (_bgImageView == nil) {
        
        NSMutableArray * array = [NSMutableArray array] ;
        NSArray * imageName = @[@"StartPage",@"StartPage2",@"StartPage3",@"StartPage4"] ;
        for (int i =0; i<4; i++) {
            UIImageView * image = [[UIImageView alloc] initWithFrame:self.view.bounds];
            image.image = [UIImage imageNamed:imageName[i] ];
            image.backgroundColor = [UIColor clearColor];
            image.alpha = 0 ;
            [array addObject:image];

        }
        _bgImageView = [array copy] ;
        
    }
    
    return _bgImageView ;
    
}

- (void)login:(UIButton *)btn {
    
    NSLog(@"%@ ",self);
    
    
}


@end
