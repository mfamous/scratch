//
//  ScratchViewController.m
//  Scratch20120503
//
//  Created by Famous Mark on 5/3/12.
//  Copyright (c) 2012 FamousFamily.com. All rights reserved.
//

#import "ScratchViewController.h"
#import "MusicStaffView.h"

@interface ScratchViewController ()

@property (nonatomic, weak) IBOutlet MusicStaffView *musicStaffView;

@end

@implementation ScratchViewController

@synthesize musicStaffView = _musicStaffView;

- (void)setMusicStaff:(MusicStaffView *)musicStaffView
{
    _musicStaffView = musicStaffView;
    UIPanGestureRecognizer *pangr = [[UIPanGestureRecognizer alloc]initWithTarget:musicStaffView action:@selector(pan:)];
    [_musicStaffView addGestureRecognizer:pangr];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setMusicStaff:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
