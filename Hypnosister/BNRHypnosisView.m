//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by 朱正晶 on 15-2-27.
//  Copyright (c) 2015年 China. All rights reserved.
//

#import "BNRHypnosisView.h"

@interface BNRHypnosisView()
@property (strong, nonatomic) UIColor *circleColor;
@end

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
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

    /*
    [path moveToPoint:CGPointMake(center.x, center.y)];
    [path addLineToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(200, 200)];
    [path addLineToPoint:CGPointMake(center.x, center.y)];
    //path.lineWidth = 10.0;
    [[UIColor lightGrayColor] setStroke];
    //[path stroke];
    [path addClip];
    */

    for (float currentRadius = 0; currentRadius < maxRadius; currentRadius += 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    
    path.lineWidth = 10.0;
    //[[UIColor lightGrayColor] setStroke];
    [self.circleColor setStroke];
    [path stroke];

    // 初级练习：绘制图像
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    CGContextSetShadow(currentContext, CGSizeMake(4, 7), 3);

    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    CGSize imageSize = logoImage.size;
    CGFloat x = rect.size.width / 2.0 - imageSize.width / 4.0;
    CGFloat y = rect.size.height / 2.0 - imageSize.height / 4.0;
    CGRect logoRect = CGRectMake(x, y, imageSize.width / 2.0, imageSize.height / 2.0);
    [logoImage drawInRect:logoRect];
    CGContextRestoreGState(currentContext);

    /*
    // 高级练习：绘制渐变三角形（未完成）
    CGFloat locations[2] = {0, 1};
    CGFloat components[8] = {1.0, 0.0, 0.0, 1.0,    // 起始颜色为红色
                             1.0, 1.0, 0.0, 1.0};   // 终点颜色为黄色
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextSaveGState(currentContext);
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, 2);
    // kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation
    CGContextDrawLinearGradient(currentContext, gradient, CGPointMake(100, 100), CGPointMake(200, 300), 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    CGContextRestoreGState(currentContext);
     */
}

- (void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched", self);
    
    CGFloat red = (arc4random() % 100) / 100.0;
    CGFloat green = (arc4random() % 100) / 100.0;
    CGFloat blue = (arc4random() % 100) / 100.0;
    UIColor *randomColor = [UIColor colorWithRed:red
                                           green:green
                                            blue:blue
                                           alpha:1.0];
    
    self.circleColor = randomColor;
}



@end
