//
//  MusicStaff.m
//  Scratch20120503
//
//  Created by Famous Mark on 5/3/12.
//  Copyright (c) 2012 FamousFamily.com. All rights reserved.
//

#import "MusicStaffView.h"

@implementation MusicStaffView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawStaff:(CGContextRef)context atY:(int)y
{
    for (int i=0; i < 11;i++) 
    {
        if( i == 5 ) continue; // space for middle C
        CGContextMoveToPoint(context, 10, y+i*10);
        CGContextAddLineToPoint(context, 310, y+i*10);
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(context);
    
    [self drawStaff:context atY:10];

//    [[UIColor greenColor] setFill];
    [[UIColor blackColor] setStroke];
    
    CGContextDrawPath(context, kCGPathStroke);
    
    CGContextClosePath(context);
}

@end
