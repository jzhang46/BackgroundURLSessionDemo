//
//  MainView.m
//  NetworkKeyboard
//
//  Created by sogou on 2018/4/16.
//  Copyright © 2018 sogou. All rights reserved.
//

#import "MainView.h"

@implementation MainView


- (void)layoutSubviews {
    [super layoutSubviews];
    self.backgroundColor = [UIColor greenColor];
}

- (CGSize)intrinsicContentSize {
    return CGSizeMake(200, 500);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
