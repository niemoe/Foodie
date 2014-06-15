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
    
    [self setUpContentViewControllers];
    
    menuVisible = YES;
    
}

- (void)setUpContentViewControllers {
    
    // Get all child view controllers and find our two interesting onses
    NSArray *childViewControllers = [self childViewControllers];
    int count = [childViewControllers count];
    for (int n = 0; n < count; n++) {
        if ([[childViewControllers objectAtIndex:n] isKindOfClass:[FOORecipeViewController class]]) {
            recipeViewController = childViewControllers[n];
            // menuViewController = ...
        }
    }
    
    [recipeViewController setDelegate:self];
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
    
    NSArray *activeConstraints = [[self view] constraints];
    int count = [activeConstraints count];
    for (int n = 0; n < count; n++) {
        if([activeConstraints[n] isKindOfClass:[NSLayoutConstraint class]]) {
            
            if([[activeConstraints[n] firstItem] tag] == 2001 &&    // First item if our left content view
               [[activeConstraints[n] secondItem] tag] == 0 &&      // Second item is the "superview"
               [activeConstraints[n] firstAttribute] == 5 &&        // Both attrubutes should be: NSLayoutAttributeLeading
               [activeConstraints[n] secondAttribute] == 5) {
                
                [activeConstraints[n] setConstant: (visible) ? 0 : -253 ]; // Set the found constraints constant depending on visibility input
            }
            
        }
    }

}


@end
