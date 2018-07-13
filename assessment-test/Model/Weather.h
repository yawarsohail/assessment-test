//
//  Weather.h
//  assessment-test
//
//  Created by Guest on 12/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherProtocol.h"

@interface Weather : NSObject<WeatherProtocol> {
    NSString *_time;
    NSNumber *_temprature;
    NSNumber *_tempratureLow;
    NSNumber *_tempratureHigh;
    NSNumber *_precip;
    NSNumber *_humidity;
    NSNumber *_windSpeed;
    NSString *_icon;
    NSString *_detail;
}

@property (copy) NSString *time;
@property (copy) NSNumber *temprature;
@property (copy) NSNumber *tempratureLow;
@property (copy) NSNumber *tempratureHigh;
@property (copy) NSNumber *precip;
@property (copy) NSNumber *humidity;
@property (copy) NSNumber *windSpeed;
@property (copy) NSString *icon;
@property (copy) NSString *detail;

-(void) setWeatherFrom:(NSDictionary *) dictionary;

@end
