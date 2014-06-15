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
    NSArray *childViewControllers = [self childViewControllers];
    int count = [childViewControllers count];
    for (int n = 0; n < count; n++) {
        if ([[childViewControllers objectAtIndex:n] isKindOfClass:[FOORecipeViewController class]]) {
            recipeViewController = childViewControllers[n];
        }
    }
    
    [recipeViewController setDelegate:self];
    
    menuVisible = YES;
    
    // Try to resize the left view
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
}

-(void)toggleMenuVisibility {
    NSLog(@"TOGGLE MENU VISIBILITY");
    
    [self setMenuVisible:!menuVisible];
    menuVisible = !menuVisible;
}

-(void)setMenuVisible:(bool)visible {
    
    NSString *visualConstraint;
    if (visible) {
        visualConstraint = @"|-(0)-[leftViewController]";
    } else if (visible == false) {
        visualConstraint = @"|-(-253)-[leftViewController]";
    }
    
    NSDictionary *viewsDictionary =
        NSDictionaryOfVariableBindings(leftViewController);
    
    NSArray *constraints =
        [NSLayoutConstraint constraintsWithVisualFormat:visualConstraint
                                                options:0 metrics:nil views:viewsDictionary];
    
    NSArray *activeConstraints = [[self view] constraints];
    int count = [activeConstraints count];
    for (int n = 0; n < count; n++) {
        if([activeConstraints[n] isKindOfClass:[NSLayoutConstraint class]]) {
            
            //if(activeConstraints[n] fir) {
                NSLog(@"%i - %i", [[activeConstraints[n] firstItem] tag], [[activeConstraints[n] secondItem] tag]);
                NSLog(@"%i - %i", [activeConstraints[n] firstAttribute] , [activeConstraints[n] secondAttribute]);
                NSLog(@"%f", [activeConstraints[n] constant]);
                
            //}
            
            if([[activeConstraints[n] firstItem] tag] == 2001 &&
               [[activeConstraints[n] secondItem] tag] == 0 &&
               [activeConstraints[n] firstAttribute] == 5 &&
               [activeConstraints[n] secondAttribute] == 5) {
                NSLog(@"Found it!");
                
                NSLayoutConstraint *positionConstraint = (NSLayoutConstraint *)activeConstraints[n];
                
                [positionConstraint setConstant: (visible) ? 0 : -253 ];
            }
            
        }
    }
    
    //[[self view] addConstraints:constraints];
}


@end
