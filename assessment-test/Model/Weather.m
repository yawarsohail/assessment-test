//
//  Weather.m
//  assessment-test
//
//  Created by Guest on 12/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//

#import "Weather.h"
#import "Utilities.h"
#import "WeatherProtocol.h"
#import "Constants.h"

@implementation Weather
@synthesize time=_time;
@synthesize temprature=_temprature;
@synthesize tempratureLow=_tempratureLow;
@synthesize tempratureHigh=_tempratureHigh;
@synthesize precip=_precip;
@synthesize humidity=_humidity;
@synthesize windSpeed=_windSpeed;
@synthesize icon=_icon;
@synthesize detail=_detail;


-(NSString*) getTime{
    return [[Utilities Instance] getDateFromString:_time format:[Constants Instance].TimeFormatThread];
}
-(NSString*) getDay{
    return [[Utilities Instance] getDateFromString:_time format:[Constants Instance].DayFormatThread];
}

-(NSString*) getTemp{
    return [NSString stringWithFormat:@"%.0f", _temprature.doubleValue];
}

-(NSString*) getTempLow{
    return [NSString stringWithFormat:@"%.0f", _tempratureLow.doubleValue];
}

-(NSString*) getTempHigh{
    return [NSString stringWithFormat:@"%.0f", _tempratureHigh.doubleValue];
}

-(NSNumber*) getHumidity{
    return _humidity;
}

-(NSNumber*) getPrecip{
    return _precip;
}

-(NSNumber*) getWind{
    return _windSpeed;
}

-(NSString*) getIcon{
    return _icon;
}
-(NSString*) getDetail{
    return _detail;
}

-(void) setWeatherFrom:(NSDictionary *) dictionary {
    _time = [[Utilities Instance] setValue:dictionary forKey:@"time" replaceWith:@""];
    _temprature = [dictionary objectForKey:@"temperature"];
    _tempratureLow = [dictionary objectForKey:@"temperatureLow"];
    _tempratureHigh = [dictionary objectForKey:@"temperatureHigh"];
    _precip = [dictionary objectForKey:@"precipProbability"];
    _humidity = [dictionary objectForKey:@"humidity"];
    _windSpeed = [dictionary objectForKey:@"windSpeed"];
    _icon = [[Utilities Instance] setValue:dictionary forKey:@"icon" replaceWith:@""];
    _detail = [[Utilities Instance] setValue:dictionary forKey:@"summary" replaceWith:@""];
}
@end
