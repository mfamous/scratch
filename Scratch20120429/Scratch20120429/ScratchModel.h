//
//  ScratchModel.h
//  Scratch20120429
//
//  Created by Famous Mark on 4/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScratchModel : NSObject

-(int)itemCount;

-(NSString *)itemAt:(int) index;

-(void)add:(NSString *)newItem;

-(NSArray *)currentItems;


@end
