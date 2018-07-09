//
//  SelectView.m
//  猎聘同道
//
//  Created by 郭朝顺 on 2018/6/11星期一.
//  Copyright © 2018年 乐乐. All rights reserved.
//

#import "SelectView.h"

@implementation SelectView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setLabelSelect:1];

    for (UILabel * temp in self.lineArray) {
        temp.alpha = 0 ;
    }
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex ;
    
    [self setLabelSelect:selectedIndex];
   
}


- (void)setLabelSelect:(NSInteger)selectedIndex {
    NSString * selStr = [NSString stringWithFormat:@"%ld",(long)selectedIndex];
    NSString * orign = @"  1  ·  2  ·  3  ·  4  " ;
    NSMutableAttributedString * att= [[NSMutableAttributedString alloc] initWithString:orign];
    NSRange range = [orign rangeOfString:selStr] ;
    [att addAttributes:@{ NSForegroundColorAttributeName :[UIColor whiteColor] } range: NSMakeRange(0, orign.length)];

    [att addAttributes:@{ NSForegroundColorAttributeName :[UIColor colorWithRed:62/255.0 green:126/255.0 blue:255/255.0 alpha:1/1.0] } range: range];
    self.label.attributedText = att;
}



@end
