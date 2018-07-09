//
//  SelectView.h
//  猎聘同道
//
//  Created by 郭朝顺 on 2018/6/11星期一.
//  Copyright © 2018年 乐乐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectView : UIView


@property (nonatomic,assign) NSInteger selectedIndex ;

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray<UILabel *> *lineArray;





@end
