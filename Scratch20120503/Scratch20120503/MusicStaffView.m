//
//  MusicStaff.m
//  Scratch20120503
//
//  Created by Famous Mark on 5/3/12.
//  Copyright (c) 2012 FamousFamily.com. All rights reserved.
//

#import "MusicStaffView.h"
#import "MusicPhrase.h"

@interface MusicStaffView()

@property (nonatomic, strong) NSString *message;

@end

@implementation MusicStaffView

@synthesize message = _message;

@synthesize phrase = _phrase;

-(void)setPhrase:(MusicPhrase *)phrase
{
    _phrase = phrase;
    
    // TESTS!
    
//    //    // Twinkle
//    [phrase addNote:[[MusicNote alloc] init:A inOctave:4 onBeat:1 forDuration:Whole withAccidental:Natural]]; 
//    [phrase addNote:[[MusicNote alloc] init:A inOctave:4 onBeat:2 forDuration:Whole withAccidental:Natural]];    
//    [phrase addNote:[[MusicNote alloc] init:E inOctave:5 onBeat:3 forDuration:Whole withAccidental:Natural]];    
//    [phrase addNote:[[MusicNote alloc] init:E inOctave:5 onBeat:4 forDuration:Whole withAccidental:Natural]];    
//    [phrase addNote:[[MusicNote alloc] init:F inOctave:5 onBeat:5 forDuration:Whole withAccidental:Sharp]];    
//    [phrase addNote:[[MusicNote alloc] init:F inOctave:5 onBeat:6 forDuration:Whole withAccidental:Sharp]];    
//    [phrase addNote:[[MusicNote alloc] init:E inOctave:5 onBeat:7 forDuration:Whole withAccidental:Natural]];  
    
    // Octaves
    [phrase addNote:[[MusicNote alloc] init:A inOctave:6 onBeat:1 forDuration:Whole withAccidental:Natural]]; 
    [phrase addNote:[[MusicNote alloc] init:A inOctave:5 onBeat:1 forDuration:Whole withAccidental:Natural]]; 
    [phrase addNote:[[MusicNote alloc] init:A inOctave:3 onBeat:1 forDuration:Whole withAccidental:Natural]]; 
    [phrase addNote:[[MusicNote alloc] init:A inOctave:2 onBeat:1 forDuration:Whole withAccidental:Natural]];  
    [phrase addNote:[[MusicNote alloc] init:A inOctave:1 onBeat:1 forDuration:Whole withAccidental:Natural]]; 
    
    // Lower Ledgers
    [phrase addNote:[[MusicNote alloc] init:B inOctave:1 onBeat:2 forDuration:Whole withAccidental:Natural]]; 
    [phrase addNote:[[MusicNote alloc] init:C inOctave:1 onBeat:3 forDuration:Whole withAccidental:Natural]];
    [phrase addNote:[[MusicNote alloc] init:D inOctave:1 onBeat:4 forDuration:Whole withAccidental:Natural]]; 
    [phrase addNote:[[MusicNote alloc] init:E inOctave:1 onBeat:5 forDuration:Whole withAccidental:Natural]]; 
    [phrase addNote:[[MusicNote alloc] init:F inOctave:1 onBeat:6 forDuration:Whole withAccidental:Natural]]; 
    [phrase addNote:[[MusicNote alloc] init:G inOctave:1 onBeat:7 forDuration:Whole withAccidental:Natural]]; 
    
    // Upper Ledgers
    [phrase addNote:[[MusicNote alloc] init:B inOctave:6 onBeat:2 forDuration:Whole withAccidental:Natural]]; 
    [phrase addNote:[[MusicNote alloc] init:C inOctave:6 onBeat:3 forDuration:Whole withAccidental:Natural]];
    [phrase addNote:[[MusicNote alloc] init:D inOctave:6 onBeat:4 forDuration:Whole withAccidental:Natural]]; 
    [phrase addNote:[[MusicNote alloc] init:E inOctave:6 onBeat:5 forDuration:Whole withAccidental:Natural]]; 
    [phrase addNote:[[MusicNote alloc] init:F inOctave:6 onBeat:6 forDuration:Whole withAccidental:Natural]]; 
    [phrase addNote:[[MusicNote alloc] init:G inOctave:6 onBeat:7 forDuration:Whole withAccidental:Natural]]; 
    
    
    [self setNeedsLayout];
}

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

#define X_OFFSET 10
#define MIDDLE_C_Y_OFFSET 180

#define NOTE_H 14
#define NOTE_H_SPACING NOTE_H / 2
#define NOTE_W 18
#define NOTE_W_SPACING 32
#define NOTE_START 20
#define OCTAVE_HEIGTH NOTE_H_SPACING * 7

// Draw staff with Middle C at p.y and length w/ p.x space on each side.
- (void)drawStaff:(CGContextRef)context
{
    UIGraphicsPushContext(context);
    
    CGContextBeginPath(context);
    
    for (int i=0; i < 11;i++) 
    {
        if( i == 5 ) continue; // space for middle C
        CGFloat staffY = self.offset.y + MIDDLE_C_Y_OFFSET + (i - 5) * NOTE_H;
        
        CGContextMoveToPoint(context, X_OFFSET, staffY);
        CGContextAddLineToPoint(context, self.bounds.size.width - X_OFFSET, staffY);
    }
    
    [[UIColor blackColor] setStroke];
    
    CGContextDrawPath(context, kCGPathStroke);
    
    UIGraphicsPopContext();
}


- (void)drawWholeNote:(CGContextRef)context at:(CGPoint)p
{
    UIGraphicsPushContext(context);
    
    CGContextBeginPath(context);
    
    CGRect noteRect = CGRectMake(p.x - NOTE_W/2+0.5, p.y - NOTE_H/2+1, NOTE_W-1, NOTE_H-2);
    
    NSLog(@"Draw Note %@", NSStringFromCGRect(noteRect));
    
    CGContextAddEllipseInRect(context, noteRect); 
    
    // Middle C
    if( p.y == self.offset.y + MIDDLE_C_Y_OFFSET )
    { 
        CGContextMoveToPoint(context, p.x - NOTE_W / 1.3, p.y);
        CGContextAddLineToPoint(context, p.x + NOTE_W / 1.3, p.y);
    }
    
    // Upper Ledger Lines
    CGFloat topLineY = self.offset.y + MIDDLE_C_Y_OFFSET - (5 * NOTE_H);
    if( p.y < topLineY )
    {
        int num = ((topLineY - p.y) / NOTE_H)+1;
        
        for (int i=1; i < num;i++) 
        {
            CGContextMoveToPoint(context, p.x - NOTE_W / 1.3, topLineY - (i*NOTE_H));
            CGContextAddLineToPoint(context, p.x + NOTE_W / 1.3, topLineY - (i*NOTE_H));
        }
    }
    
    // Lower Ledger Lines
    CGFloat bottomLineY = self.offset.y + MIDDLE_C_Y_OFFSET + (5 * NOTE_H);
    if( p.y > bottomLineY )
    {
        int num = ((p.y - bottomLineY) / NOTE_H)+1;
        
        for (int i=1; i < num;i++) 
        {
            CGContextMoveToPoint(context, p.x - NOTE_W / 1.3, bottomLineY + (i*NOTE_H));
            CGContextAddLineToPoint(context, p.x + NOTE_W / 1.3, bottomLineY + (i*NOTE_H));
        }
    }
    
    
    CGContextStrokePath(context);
    
    UIGraphicsPopContext();
}

- (void)drawScale:(MusicNote*)note onContext:(CGContextRef)context
{
    CGPoint p = [self pointForNote:note];
    for (int i=0; i < 8; i++) 
    {
        [self drawWholeNote:context at:CGPointMake(p.x + (i * NOTE_W * 2), p.y  - (i*NOTE_H/2))];
    }
}

- (CGPoint)pointForNote:(MusicNote *)note
{
    CGFloat noteY = self.offset.y + MIDDLE_C_Y_OFFSET + (4 - note.octave) * OCTAVE_HEIGTH;
    
    
    // Middle C zero
    // An octave is NOTE_H / 2 * 8
    switch (note.pitch) {
            //        case C:
            //            noteY += 0;
            //            break;
        case D:
            noteY -= NOTE_H_SPACING;
            break;
        case E:
            noteY -= NOTE_H_SPACING*2;
            break;
        case F:
            noteY -= NOTE_H_SPACING*3;
            break;
        case G:
            noteY -= NOTE_H_SPACING*4;
            break;
        case A:
            noteY -= NOTE_H_SPACING*5;
            break;
        case B:
            noteY -= NOTE_H_SPACING*6;
            break;
        default:
            break;
    }
    
    
    int x = NOTE_START + (note.beat * NOTE_W_SPACING);
    
    CGPoint notePoint = CGPointMake(x, noteY);
    return notePoint;
}

- (void)drawNote:(MusicNote*)note onContext:(CGContextRef)context
{
    NSLog(@"%@", note);
    
    CGPoint notePoint;
    notePoint = [self pointForNote:note];
    
    [self drawWholeNote:context at:notePoint];
    
}


- (void)drawPhrase:(CGContextRef)context
{
    for (MusicNote *note in self.phrase.notes) 
    {
        [self drawNote:note onContext:context];
    }

}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    NSLog(@"Offset: %@", NSStringFromCGPoint(self.offset));
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self drawStaff:context];
    
    [self drawPhrase:context];
    
    //    [[UIColor greenColor] setFill];
    
    
    [self.message drawAtPoint:CGPointMake(self.offset.x + 10, self.offset.y + 50) withFont:[UIFont fontWithName:@"Verdana" size:17]];
    
    [self drawScale:(MusicNote*)[[MusicNote alloc]init:C inOctave:4 onBeat:1 forDuration:Quarter withAccidental:Natural] onContext:context];
    
    [self drawScale:(MusicNote*)[[MusicNote alloc]init:C inOctave:3 onBeat:1 forDuration:Quarter withAccidental:Natural] onContext:context];
    
    CGContextClosePath(context);    
}

- (void)pan:(UIPanGestureRecognizer *)gesture
{    
    CGPoint translatedPoint = [gesture translationInView:self];
    
    [gesture setTranslation:CGPointZero inView:self];
    
    if(( gesture.state == UIGestureRecognizerStateChanged) ||
       ( gesture.state == UIGestureRecognizerStateEnded))
    {
        self.offset = CGPointMake(MAX(self.offset.x + translatedPoint.x, 0), 
                                  MIN(self.bounds.size.height - MIDDLE_C_Y_OFFSET, MAX(self.offset.y + translatedPoint.y, 0)));
    }
    
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
