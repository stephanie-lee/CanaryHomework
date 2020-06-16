//
//  DetailViewModel.m
//  CanaryHomework
//
//  Created by Steph Lee on 6/15/20.
//  Copyright © 2020 Michael Schroeder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Device+CoreDataClass.h"
#import "Reading+CoreDataClass.h"
#import "DetailViewModel.h"

NSString * const kNameText = @"Name";
NSString * const kMaxText = @"Max";
NSString * const kMinText = @"Min";
NSString * const kAverageText = @"Average";

@interface DetailViewModel ()

@property (nonatomic, assign, nullable) NSNumber *maxValue;
@property (nonatomic, assign, nullable) NSNumber *minValue;
@property (nonatomic, assign, nullable) NSNumber *averageValue;

@property (nonatomic, assign, nonnull) NSString *nameText;
@property (nonatomic, assign, nonnull) NSString *maxText;
@property (nonatomic, assign, nonnull) NSString *minText;
@property (nonatomic, assign, nonnull) NSString *averageText;

@end


@implementation DetailViewModel

- (instancetype)initWithDevice:(nonnull Device *)device {
    self = [super init];
    if (self) {
        [self _getDeviceReadingsDataFromDevice:device];
        [self _setUpStringsWithDevice:device];
    }
    return self;
}

- (void)_getDeviceReadingsDataFromDevice:(Device *)device {
    NSSet<Reading *> *readings = device.readings;
    if (device.readings.count <= 0) {
        return;
    }

    NSDecimalNumber *total = NSDecimalNumber.zero;
    for (Reading* reading in readings) {
        NSNumber *value = reading.value;
        if (value == nil) {
            continue;
        }
        
        if (_maxValue == nil || [_maxValue compare:value] == NSOrderedAscending) {
            _maxValue = value;
        }
        
        if (_minValue == nil || [_minValue compare:value] == NSOrderedDescending) {
            _minValue = value;
        }
        
        NSDecimalNumber *decimalValue = [NSDecimalNumber decimalNumberWithDecimal:value.decimalValue];
        total = [total decimalNumberByAdding:decimalValue];
    }
    
    NSString *count = [NSString stringWithFormat:@"%lu", (unsigned long)readings.count];
    NSDecimalNumber *divisor = [NSDecimalNumber decimalNumberWithString:count];
    _averageValue = [total decimalNumberByDividingBy:divisor];
}

- (void)_setUpStringsWithDevice:(Device *)device {
    _nameText = [self _textForLabel:kNameText withValue:device.name];
    _maxText = [self _textForLabel:kMaxText withValue:[self _formatNumber:_maxValue]];
    _minText = [self _textForLabel:kMinText withValue:[self _formatNumber:_minValue]];
    _averageText = [self _textForLabel:kAverageText withValue:[self _formatNumber:_averageValue]];
}

- (NSString *)_formatNumber:(NSNumber *)number {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setMaximumSignificantDigits:5];
    [formatter setMaximumFractionDigits:2];
    [formatter setRoundingMode:NSNumberFormatterRoundCeiling];
    
    return [formatter stringFromNumber:number];
}

- (NSString *)_textForLabel:(NSString *)labelName withValue:(nullable NSString*)text {
    NSString *formatString = @"%@: %@";
    
    NSString *detailText = nil;
    if (text != nil) {
        detailText = text;
    } else {
        detailText = @"Unavailable";
    }
    
    return [NSString stringWithFormat:formatString, labelName, detailText];
}

@end
