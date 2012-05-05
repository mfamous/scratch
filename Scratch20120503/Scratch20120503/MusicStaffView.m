//
//  MusicStaff.m
//  Scratch20120503
//
//  Created by Famous Mark on 5/3/12.
//  Copyright (c) 2012 FamousFamily.com. All rights reserved.
//

#import "MusicStaffView.h"

@interface MusicStaffView()

@property (nonatomic, strong) NSString *message;

@end

@implementation MusicStaffView

@synthesize message = _message;

@synthesize offset = _offset;

- (void)setOffset:(CGPoint)offset  
{
    _offset = offset;
    [self setNeedsDisplay];
}

- (CGPoint)offset
{
    return _offset;
}

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
    UIGraphicsPushContext(context);
    
    for (int i=0; i < 11;i++) 
    {
        if( i == 5 ) continue; // space for middle C
        CGContextMoveToPoint(context, self.offset.x + 10, self.offset.y + y+i*10);
        CGContextAddLineToPoint(context, self.offset.x + 310, self.offset.y + y+i*10);
    }
    
    [[UIColor blackColor] setStroke];
    
    CGContextDrawPath(context, kCGPathStroke);
    
    [self.message drawAtPoint:CGPointMake(self.offset.x + 10, self.offset.y + 50) withFont:[UIFont fontWithName:@"Verdana" size:17]];
    
    UIGraphicsPopContext();
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(context);
    
    [self drawStaff:context atY:10];

//    [[UIColor greenColor] setFill];

    
    CGContextClosePath(context);
}

- (void)pan:(UIPanGestureRecognizer *)gesture
{    
    CGPoint translatedPoint = [gesture translationInView:self];
    
    [gesture setTranslation:CGPointZero inView:self];
    
    self.offset = CGPointMake(self.offset.x + translatedPoint.x, self.offset.y + translatedPoint.y);
    
    NSLog(@"offset: %@",  NSStringFromCGPoint(translatedPoint));
    

        
        
        NSLog(@"offset: %@",  NSStringFromCGPoint(self.offset));
        
    
    // self.message = [NSString stringWithFormat:@"Gesture State: %d", gesture.state];

    
    [self setNeedsDisplay];

//    if(( gesture.state == UIGestureRecognizerStateChanged) ||
//       ( gesture.state == UIGestureRecognizerStateEnded))
//    {
//        self.offset.x += gesture.
//    }
//    }
}

@end
