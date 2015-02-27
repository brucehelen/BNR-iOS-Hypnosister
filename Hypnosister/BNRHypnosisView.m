//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by 朱正晶 on 15-2-27.
//  Copyright (c) 2015年 China. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;

    //float radius = (MIN(bounds.size.height, bounds.size.width) / 2.0);
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    UIBezierPath *path = [[UIBezierPath alloc] init];

    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path addArcWithCenter:center
                        radius:maxRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
        NSLog(@"current = %f", currentRadius);
    }

    path.lineWidth = 10.0;
    [[UIColor lightGrayColor] setStroke];
    [path stroke];
}


@end
