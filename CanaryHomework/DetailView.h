//
//  DetailView.h
//  CanaryHomework
//
//  Created by Steph Lee on 6/15/20.
//  Copyright © 2020 Michael Schroeder. All rights reserved.
//

@import UIKit;

@class DetailViewModel;

@interface DetailView : UIView

- (void)configureWithViewModel:(DetailViewModel *)viewModel;

@end
