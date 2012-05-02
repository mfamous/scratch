//
//  ScratchModel.m
//  Scratch20120429
//
//  Created by Famous Mark on 4/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ScratchModel.h"

@interface ScratchModel()

@property (nonatomic, strong) NSMutableArray *items;

@end


@implementation ScratchModel

@synthesize items = _items;

- (id)init
{
    self = [super init];
    if( self )
    {
        NSArray *saved = [[NSUserDefaults standardUserDefaults] arrayForKey:@"names"];
        
        [self.items addObjectsFromArray:saved];
//
//        [self.items addObject:@"Mark"];
//        [self.items addObject:@"Emma"];
//        [self.items addObject:@"Erin"];
//        [self.items addObject:@"Adam"];
                
    }
    return self;
}
         
- (NSMutableArray *)items
{
    if (!_items)
    {
        _items = [[NSMutableArray alloc] initWithCapacity:10];
    }
    return _items;
}
         

-(int)itemCount
{
    return self.items.count;
}

-(NSString *)itemAt:(int) index
{
    return [self.items objectAtIndex:index];
}

-(void)add:(NSString *)newItem
{
    [self.items addObject:newItem];
    [[NSUserDefaults standardUserDefaults] setObject:self.items forKey:@"names"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSArray *)currentItems
{
    return self.items.copy;
}
         
@end
