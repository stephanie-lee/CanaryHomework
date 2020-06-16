//
//  DetailViewController.h
//  CanaryHomework
//
//  Created by Michael Schroeder on 9/24/19.
//  Copyright © 2019 Michael Schroeder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailView.h"

@class Device;

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

- (nonnull instancetype)initWithDevice:(nonnull Device *)device NS_DESIGNATED_INITIALIZER;

- (nonnull instancetype)init __attribute__((unavailable("use initWithDevice:")));
- (nonnull instancetype)new __attribute__((unavailable("use initWithDevice:")));

@end

NS_ASSUME_NONNULL_END
