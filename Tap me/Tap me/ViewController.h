//
//  ViewController.h
//  Tap me
//
//  Created by ztl on 5/4/17.
//  Copyright © 2017 ztl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate> {

IBOutlet UILabel *scoreLabel;
IBOutlet UILabel *timerLabel;
 
    NSInteger count;
    NSInteger seconds;
    NSTimer *timer;
    
}

- (IBAction)buttonPressed;

@end

