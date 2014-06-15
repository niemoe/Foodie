//
//  FOOViewController.h
//  Foodie
//
//  Created by Sebastian Möser on 15/06/14.
//  Copyright (c) 2014 Modulum. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FOORecipeViewController.h"

@class FOORecipeViewController;

@interface FOOSplitViewController : UIViewController <MenuToggleActionDelegate> {

    BOOL menuVisible;
    
    IBOutlet UIView* leftViewController;
    IBOutlet UIView* rightViewController;
    
    UIViewController *menuViewController;
    FOORecipeViewController *recipeViewController;
}

@end
