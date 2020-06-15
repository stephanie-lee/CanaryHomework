//
//  DetailView.m
//  CanaryHomework
//
//  Created by Steph Lee on 6/15/20.
//  Copyright © 2020 Michael Schroeder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailView.h"

static const CGFloat kPadding = 50.0f;

@interface DetailView ()

@property(nonatomic, retain) UILayoutGuide *safeArea;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *maxLabel;
@property (nonatomic, strong) UILabel *minLabel;
@property (nonatomic, strong) UILabel *averageLabel;

@end

@implementation DetailView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        self.safeArea = self.layoutMarginsGuide;
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.nameLabel];
        [self addSubview:self.maxLabel];
        [self addSubview:self.minLabel];
        [self addSubview:self.averageLabel];
        
        // TODO: test content, pass in viewModel instead
        self.nameLabel.text = @"Name";
        self.maxLabel.text = @"Max";
        self.minLabel.text = @"Min";
        self.averageLabel.text = @"Average";
    }
    
    return self;
}

#pragma mark - Layout & Constraints

- (void)updateConstraints {
    [self _initializeSharedConstraints];
    [super updateConstraints];
}

- (void)_initializeSharedConstraints {
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = false;
    self.maxLabel.translatesAutoresizingMaskIntoConstraints = false;
    self.minLabel.translatesAutoresizingMaskIntoConstraints = false;
    self.averageLabel.translatesAutoresizingMaskIntoConstraints = false;
    
    [NSLayoutConstraint activateConstraints: @[
        [self.nameLabel.topAnchor constraintEqualToAnchor:self.safeArea.topAnchor constant:kPadding],
        [self.nameLabel.leadingAnchor constraintEqualToAnchor:self.safeArea.leadingAnchor],
        [self.nameLabel.trailingAnchor constraintEqualToAnchor:self.safeArea.trailingAnchor],
        [self.maxLabel.topAnchor constraintEqualToAnchor:self.nameLabel.bottomAnchor],
        [self.maxLabel.leadingAnchor constraintEqualToAnchor:self.safeArea.leadingAnchor],
        [self.maxLabel.trailingAnchor constraintEqualToAnchor:self.safeArea.trailingAnchor],
        [self.minLabel.topAnchor constraintEqualToAnchor:self.maxLabel.bottomAnchor],
        [self.minLabel.leadingAnchor constraintEqualToAnchor:self.safeArea.leadingAnchor],
        [self.minLabel.trailingAnchor constraintEqualToAnchor:self.safeArea.trailingAnchor],
        [self.averageLabel.topAnchor constraintEqualToAnchor:self.minLabel.bottomAnchor],
        [self.averageLabel.leadingAnchor constraintEqualToAnchor:self.safeArea.leadingAnchor],
        [self.averageLabel.trailingAnchor constraintEqualToAnchor:self.safeArea.trailingAnchor],
     ]
    ];
}

#pragma mark - Lazy Loaders

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
    }
    
    return _nameLabel;
}

- (UILabel *)maxLabel {
    if (!_maxLabel) {
        _maxLabel = [[UILabel alloc] init];
    }
    
    return _maxLabel;
}

- (UILabel *)minLabel {
    if (!_minLabel) {
        _minLabel = [[UILabel alloc] init];
    }
    
    return _minLabel;
}

- (UILabel *)averageLabel {
    if (!_averageLabel) {
        _averageLabel = [[UILabel alloc] init];
    }
    
    return _averageLabel;
}

@end
