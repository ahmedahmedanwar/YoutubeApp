//
//  VideoViewViewController.m
//  YoutubeApp
//
//  Created by Ahmed on 3/25/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

#import "VideoViewViewController.h"

@interface VideoViewViewController ()

@end

@implementation VideoViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.playerView loadWithVideoId:@"M7lc1UVf-VE"];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
