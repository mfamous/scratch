//
//  MusicStaff.h
//  Scratch20120503
//
//  Created by Famous Mark on 5/3/12.
//  Copyright (c) 2012 FamousFamily.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicPhrase.h"

@interface MusicStaffView : UIView

@property (nonatomic) CGPoint offset;

@property (nonatomic, strong) MusicPhrase *phrase;

@end
