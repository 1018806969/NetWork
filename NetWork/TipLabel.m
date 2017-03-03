//
//  TipLabel.m
//  NetWork
//
//  Created by txx on 17/3/2.
//  Copyright © 2017年 txx. All rights reserved.
//

#import "TipLabel.h"

@implementation TipLabel

static TipLabel *tipLabel = nil ;

+(void)show:(NSString *)msg
{
    if (!tipLabel) {
        tipLabel = [[TipLabel alloc]initWithMsg:msg];
        [[UIApplication sharedApplication].delegate.window addSubview:tipLabel];
        
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        CGRect rect = [msg boundingRectWithSize:CGSizeMake(width-50, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
        
        tipLabel.frame = CGRectMake(width/2-rect.size.width/2, height*0.7, rect.size.width+10, rect.size.height+5);
        [self performSelector:@selector(delayMethod) withObject:nil afterDelay:3.0f];
    }
}
-(instancetype)initWithMsg:(NSString *)msg
{
    self = [super init];
    if (self) {
        self.text = msg ;
        self.font = [UIFont systemFontOfSize:14];
        self.textColor = [UIColor whiteColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.backgroundColor = [UIColor blackColor];
        self.numberOfLines = 0 ;
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES ;
    }
    return self ;
}
+(void)delayMethod
{
    [UIView animateWithDuration:1 animations:^{
        tipLabel.alpha = 0;
        [tipLabel removeFromSuperview];
        tipLabel = nil ;
    }];
}

@end
