//
//  FOORecipeViewController.h
//  Foodie
//
//  Created by Sebastian Möser on 15/06/14.
//  Copyright (c) 2014 Modulum. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FOOSplitViewController;
@protocol MenuToggleActionDelegate <NSObject>

-(void)toggleMenuVisibility;

@end

@interface FOORecipeViewController : UIViewController {
    
}
-(IBAction)toggleMenuButtonPressed:(id)sender;

@property (nonatomic, weak) id<MenuToggleActionDelegate> delegate;

@end


