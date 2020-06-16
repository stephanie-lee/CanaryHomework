//
//  DetailViewController.m
//  CanaryHomework
//
//  Created by Michael Schroeder on 9/24/19.
//  Copyright © 2019 Michael Schroeder. All rights reserved.
//

#import "DetailViewController.h"
#import "Device+CoreDataClass.h"
#import "DetailViewModel.h"
#import "CoreDataController.h"

@interface DetailViewController ()

@property(nonatomic, strong, nonnull) Device *device;
@property(nonatomic, strong) NSArray<Reading *> *readings;
@property(nonatomic, strong, nonnull) DetailView *detailView;

@end

@implementation DetailViewController

- (instancetype)initWithDevice:(Device *)device {
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.device = device;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"About Device";
    
    self.detailView = [[DetailView alloc] initWithFrame:CGRectZero];
    self.view = self.detailView;

    [self _fetchReadingDataForDevice:self.device];
}

- (void)_fetchReadingDataForDevice:(Device *)device {
    __weak typeof(self) weakSelf = self;
    [[CoreDataController sharedCache] getReadingsForDevice:[device deviceID] completionBlock:^(BOOL completed, BOOL success, NSArray * _Nonnull objects) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            DetailViewModel *viewModel = [[DetailViewModel alloc] initWithDevice:weakSelf.device];
            [weakSelf.detailView configureWithViewModel:viewModel];
        });
    }];
}

@end
