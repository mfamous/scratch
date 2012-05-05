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
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setup];
}

- (void)setup
{
    _offset = CGPointMake(10, 10);
}


#define NOTE_H 10
#define NOTE_W 12

- (void)drawStaff:(CGContextRef)context at:(CGPoint)p
{
    UIGraphicsPushContext(context);
    
    CGContextBeginPath(context);
    
    for (int i=0; i < 11;i++) 
    {
        if( i == 5 ) continue; // space for middle C
        CGContextMoveToPoint(context, p.x + 10, p.y + i*NOTE_H);
        CGContextAddLineToPoint(context, p.x + 310, p.y + i*NOTE_H);
    }
    
    [[UIColor blackColor] setStroke];
    
    CGContextDrawPath(context, kCGPathStroke);
    
    UIGraphicsPopContext();
}


- (void)drawWholeNote:(CGContextRef)context at:(CGPoint)p
{
    CGContextBeginPath(context);
    
    CGRect noteRect = CGRectMake(p.x - NOTE_W/2, p.y - NOTE_H/2, NOTE_W, NOTE_H);
    
    NSLog(@"Draw Note %@", NSStringFromCGRect(noteRect));
    
    CGContextAddEllipseInRect(context, noteRect); 
    
    // Middle C
    if( p.y - self.offset.y == NOTE_H / 2 * 10 )
    { 
        CGContextMoveToPoint(context, p.x - NOTE_W / 1.3, p.y);
        CGContextAddLineToPoint(context, p.x + NOTE_W / 1.2, p.y);
    }
                              
    
    CGContextStrokePath(context);
}

- (void)drawDescendingScale:(CGContextRef)context at:(CGPoint)p
{
    for (int i=0; i < 8;i++) 
    {
        [self drawWholeNote:context at:CGPointMake(p.x + (i * NOTE_W * 2), p.y  + (i*NOTE_H/2))];
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
        NSLog(@"Draw %@", NSStringFromCGPoint(self.offset));
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self drawStaff:context at:self.offset];

//    [[UIColor greenColor] setFill];
    
    
    [self.message drawAtPoint:CGPointMake(self.offset.x + 10, self.offset.y + 50) withFont:[UIFont fontWithName:@"Verdana" size:17]];

    [self drawDescendingScale:context at:CGPointMake(self.offset.x + 40, self.offset.y + 3 * NOTE_H / 2)];
    
    [self drawDescendingScale:context at:CGPointMake(self.offset.x + 40, self.offset.y + 10 * NOTE_H / 2)];
    
    CGContextClosePath(context);    
}

- (void)pan:(UIPanGestureRecognizer *)gesture
{    
    CGPoint translatedPoint = [gesture translationInView:self];
    
    [gesture setTranslation:CGPointZero inView:self];

    
    self.offset = CGPointMake(MAX(self.offset.x + translatedPoint.x, 0), 
                              MAX(self.offset.y + translatedPoint.y, 0));
    
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
