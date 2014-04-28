//
//  JNHomeEmbedViewController.m
//  JNPullDown
//
//  Created by jamesn on 4/25/14.
//  Copyright (c) 2014 jamesn. All rights reserved.
//

#import "JNHomeEmbedViewController.h"
#import "JNContainerViewController.h"
#import "JNHiddenTableViewController.h"
#import "MBPullDownController.h"

#define kHiddenMenuOpenOffset       360.0f
#define kHiddenMenuClosedOffset     -80.0f

@interface JNHomeEmbedViewController ()
@property (nonatomic, weak) JNContainerViewController *containerViewController;
@end

@implementation JNHomeEmbedViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"embedContainer"]) {
        self.containerViewController = segue.destinationViewController;
        UINavigationController *navigationControllerTarget = (UINavigationController *)segue.destinationViewController;
        navigationControllerTarget.navigationBarHidden  = YES;
        
        UIViewController *scrollVC = [self.storyboard instantiateViewControllerWithIdentifier:@"homeScrollVC"];
        JNHiddenTableViewController *back = [self.storyboard instantiateViewControllerWithIdentifier:@"homeHiddenMenuTableVC"];
        MBPullDownController *pullDownVC = (MBPullDownController *)[navigationControllerTarget topViewController];
        
        [pullDownVC setOpenBottomOffset:kHiddenMenuOpenOffset];
        [pullDownVC setClosedTopOffset:kHiddenMenuClosedOffset];
        [pullDownVC setCloseDragOffset:0.0f];
        [pullDownVC setBackController:back];
        [pullDownVC setFrontController:scrollVC];
        
    }
}


@end
