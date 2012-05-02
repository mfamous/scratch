//
//  ScratchViewController.h
//  Scratch20120429
//
//  Created by Famous Mark on 4/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScratchViewController : UIViewController

- (IBAction)doSomething;

@property (weak, nonatomic) IBOutlet UITextField *inputText;
@property (weak, nonatomic) IBOutlet UILabel *displayText;

@end
