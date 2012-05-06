//
//  Phrase.h
//  Scratch20120503
//
//  Created by Famous Mark on 5/5/12.
//  Copyright (c) 2012 famousfamily.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MusicNote.h"
#import "Music.h"

@interface Foo : NSObject

-(void) addNote:(MusicNote*)note;

-(void) clear;

@property (nonatomic, readonly) NSArray *notes;

@end
