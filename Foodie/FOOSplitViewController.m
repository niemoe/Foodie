//
//  FOOViewController.m
//  Foodie
//
//  Created by Sebastian Möser on 15/06/14.
//  Copyright (c) 2014 Modulum. All rights reserved.
//

#import "FOOSplitViewController.h"

@interface FOOSplitViewController ()

@end

@implementation FOOSplitViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Try to resize the left view
    NSDictionary *viewsDictionary =
    NSDictionaryOfVariableBindings(leftViewController);
    
    NSArray *constraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"|-(-253)-[leftViewController]"
                                            options:0 metrics:nil views:viewsDictionary];
    
    [[self view] addConstraints:constraints];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
