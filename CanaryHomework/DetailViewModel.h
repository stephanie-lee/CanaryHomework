//
//  DetailViewModel.h
//  CanaryHomework
//
//  Created by Steph Lee on 6/15/20.
//  Copyright © 2020 Michael Schroeder. All rights reserved.
//

@class Device;
@interface DetailViewModel : NSObject

@property (nonatomic, readonly, nonnull) NSString *nameText;
@property (nonatomic, readonly, nonnull) NSString *maxText;
@property (nonatomic, readonly, nonnull) NSString *minText;
@property (nonatomic, readonly, nonnull) NSString *averageText;

- (nonnull instancetype)initWithDevice:(nonnull Device *)device NS_DESIGNATED_INITIALIZER;

- (nonnull instancetype)init __attribute__((unavailable("use initWithDevice:")));
- (nonnull instancetype)new __attribute__((unavailable("use initWithDevice:")));

@end
