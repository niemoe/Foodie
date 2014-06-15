//
//  FOORecipeViewController.m
//  Foodie
//
//  Created by Sebastian Möser on 15/06/14.
//  Copyright (c) 2014 Modulum. All rights reserved.
//

#import "FOORecipeViewController.h"

@interface FOORecipeViewController ()

@end

@implementation FOORecipeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //[self setDelegate:[self parentViewController]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)toggleMenuButtonPressed:(id)sender {
    NSLog(@"Now toggle the menu");
    
    if ([[self delegate] respondsToSelector:@selector(toggleMenuVisibility)]) {
        [[self delegate] toggleMenuVisibility];
    } else {
        NSLog(@"Sorry, delegate not set up correctly");
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
