//
//  Pitch.h
//  Scratch20120503
//
//  Created by Famous Mark on 5/5/12.
//  Copyright (c) 2012 famousfamily.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Music.h"

@interface MusicNote : NSObject

-(MusicNote*)init:(Pitch)pitch inOctave:(int)octave onBeat:(int)beat forDuration:(NoteDuration)duration withAccidental:(Accidental)accidental;

@property (nonatomic) Pitch pitch;

@property (nonatomic) Accidental accidental;

@property (nonatomic) int octave; // 4 if C4, middle C

@property (nonatomic) int beat;

@property (nonatomic) NoteDuration duration;

@end
