//
//  ViewController.m
//  Tap me
//
//  Created by ztl on 5/4/17.
//  Copyright © 2017 ztl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property bool started;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _started = false;
    [self setupGame];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed {
    NSLog(@"Pressed!");
    count++;
    if (_started == false) {
        _started = true;
        
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                 target:self
                                               selector:@selector(subtractTime)
                                               userInfo:nil
                                                repeats:YES];
    }
    scoreLabel.text = [NSString stringWithFormat:@"Score\n%ld", (long long)count];
}

- (void)setupGame {
    // 1
    seconds = 30;
    count = 0;
    
    // 2
    timerLabel.text = [NSString stringWithFormat:@"Time: %i", seconds];
    scoreLabel.text = [NSString stringWithFormat:@"Score\n%i", count];
    
    // 3
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    _started = false;
    [self setupGame];
}

- (void)subtractTime {
    // 1
    seconds--;
    timerLabel.text = [NSString stringWithFormat:@"Time: %i",seconds];
    
    // 2
    if (seconds == 0) {
        [timer invalidate];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time is up!"
                                                        message:[NSString stringWithFormat:@"You scored %i points", count]
                                                       delegate:self
                                              cancelButtonTitle:@"Play Again"
                                              otherButtonTitles:nil];
        
        [alert show];
    }
}

@end
