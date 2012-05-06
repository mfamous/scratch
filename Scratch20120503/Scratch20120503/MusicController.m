//
//  ScratchViewController.m
//  Scratch20120503
//
//  Created by Famous Mark on 5/3/12.
//  Copyright (c) 2012 FamousFamily.com. All rights reserved.
//

#import "MusicController.h"
#import "MusicStaffView.h"
#import "MusicPhrase.h"
#import "MusicNote.h"

@interface MusicController ()

@property (nonatomic, weak) IBOutlet MusicStaffView *musicStaffView;

@end

@implementation MusicController

@synthesize musicStaffView = _musicStaffView;

- (void)setMusicStaff:(MusicStaffView *)musicStaffView
{
    _musicStaffView = musicStaffView;
    
    UIPanGestureRecognizer *pangr = [[UIPanGestureRecognizer alloc]initWithTarget:musicStaffView action:@selector(pan:)];
    [self.musicStaffView addGestureRecognizer:pangr];
    
    MusicPhrase *phrase = [[MusicPhrase alloc]init];
    
    // G-C Perfect 5th
    [phrase addNote:[[MusicNote alloc] init:G inOctave:4 onBeat:1 forDuration:Whole withAccidental:Natural]];
    [phrase addNote:[[MusicNote alloc] init:C inOctave:5 onBeat:1 forDuration:Whole withAccidental:Natural]];
    

    
    
    
    
    self.musicStaffView.phrase = phrase;
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
