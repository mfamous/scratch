//
//  ScratchViewController.m
//  Scratch20120429
//
//  Created by Famous Mark on 4/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ScratchViewController.h"
#import "ScratchModel.h"

@interface ScratchViewController()

    @property (nonatomic, strong) ScratchModel *model;

@end

@implementation ScratchViewController
@synthesize inputText = _inputText;
@synthesize displayText = _display;

@synthesize model = _model;

-(ScratchModel *)model
{
    if( !_model) _model = [[ScratchModel alloc]init];
    return _model;
}


- (IBAction)doSomething
{
    if( !self.inputText.text ) return;
    [self.model add:self.inputText.text];
//    self.display.text = [self.display.text stringByAppendingString:  [NSString stringWithFormat:@"%i\n", [self.model itemCount]]];
    self.displayText.text = [self.model.currentItems componentsJoinedByString:@"\n"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setDisplayText:nil];
    [self setInputText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    [self.inputText 
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


@end
