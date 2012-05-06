//
//  Pitch.m
//  Scratch20120503
//
//  Created by Famous Mark on 5/5/12.
//  Copyright (c) 2012 famousfamily.com. All rights reserved.
//

#import "MusicNote.h"

@implementation MusicNote

@synthesize pitch = _pitch;
@synthesize accidental = _accidental;
@synthesize octave = _octave;
@synthesize duration = _duration;
@synthesize beat = _beat;

//-(Pitch*)init
//{
//
//}
//
//-(Pitch*)init:(Note)note inOctave:(int)octave
//{
//    return [init
//}

-(MusicNote*)init:(Pitch)pitch inOctave:(int)octave onBeat:(int)beat forDuration:(NoteDuration)duration withAccidental:(Accidental)accidental
{
    MusicNote* r = [super init];
    r.octave = octave;
    r.pitch = pitch;
    r.accidental = accidental;
    r.duration = duration;
    r.beat = beat;
    return r;
}

-(NSString*)description
{
    NSString* pitchString;
    switch (self.pitch) {
        case C:
            pitchString = @"C";
            break;
        case D:
            pitchString = @"D";
            break;
        case E:
            pitchString = @"E";
            break;
        case F:
            pitchString = @"F";
            break;
        case G:
            pitchString = @"G";
            break;
        case A:
            pitchString = @"A";
            break;
        case B:
            pitchString = @"B";
            break;
    }
    NSString* accidentalString;
    switch (self.accidental) {
        case Natural:
            accidentalString = @"";
            break;
        case Sharp:
            accidentalString = @"♯";
            break;
        case Flat:
            accidentalString = @"♭";
            break;
        case DoubleSharp:
            accidentalString = @"𝄪";
            break;
        case DoubleFlat:
            accidentalString = @"𝄫";
            break;
    }
    NSString* durationString;
    switch (self.duration) {
        case Whole:
            durationString = @"Whole Note";
            break;
        case Half:
            durationString = @"Half Note";
            break;            
        case DottedHalf:
            durationString = @"Dotted Half Note";
            break;
        case Quarter:
            durationString = @"♩";
            break;
        case DottedQuarter:
            durationString = @"Dotted Quarter";
            break;
        case Eighth:
            durationString = @"Eigth Note";
            break;
        case DottedEight:
            durationString = @"Dotted Eigth Note";
            break;
        case Sixteenth:
            durationString = @"Sixteenth Note";
            break;
    }
    
    
    
    
    return [NSString stringWithFormat:@"%@%@%d %@ on beat %d", pitchString, accidentalString, self.octave, durationString, self.beat ];
}

@end
