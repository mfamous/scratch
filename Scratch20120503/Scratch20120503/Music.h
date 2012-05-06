//
//  Music.h
//  Scratch20120503
//
//  Created by Famous Mark on 5/5/12.
//  Copyright (c) 2012 famousfamily.com. All rights reserved.
//

#ifndef Scratch20120503_Music_h
#define Scratch20120503_Music_h

typedef enum {
    
    CMajor,
    
    GMajor,
    DMajor,
    AMajor,
    EMajor,
    BMajor,
    FSharpMajor,
    CSharpMajor,
    
    CFlatMajor,
    GFlatMajor,
    DFlatMajor,
    AFlatMajor,
    EFlatMajor,
    BFlatMajor,
    FMajor
    
} KeySignature;

typedef enum {
    C,
    D,
    E,
    F,
    G,
    A,
    B
} Pitch;

typedef enum {
    Natural,
    Sharp,
    Flat,
    DoubleSharp,
    DoubleFlat
} Accidental;

typedef enum {
    Major,
    Minor,
    Augmented,
    Diminished,
    Perfect
} Interval;

typedef enum
{
    Whole,
    Half,
    DottedHalf,
    Quarter,
    DottedQuarter,
    Eighth,
    DottedEight,
    Sixteenth
} NoteDuration;


#endif
