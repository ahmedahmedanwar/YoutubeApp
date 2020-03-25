//
//  VideoViewViewController.h
//  YoutubeApp
//
//  Created by Ahmed on 3/25/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YTPlayerView.h>
NS_ASSUME_NONNULL_BEGIN

@interface VideoViewViewController : UIViewController

@property(nonatomic, strong) IBOutlet YTPlayerView *playerView;

@end

NS_ASSUME_NONNULL_END
