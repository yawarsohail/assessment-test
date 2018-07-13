//
//  Constants.m
//  assessment-test
//
//  Created by Guest on 11/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//

#import "Constants.h"

@implementation Constants
static Constants *constants=nil;

+(void) initialize
{
    if (self == [Constants class]) {
        constants = [[Constants alloc] init];
    }
}

+(Constants*) Instance
{
    return constants;
}

-(NSString*) hotelURL
{
    if(!hotelURL)
        hotelURL = @"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%@,%@&radius=2500&types=lodging&key=%@";
    return hotelURL;
}

-(NSString*) weatherURL
{
    if(!weatherURL)
        weatherURL = @"https://api.darksky.net/forecast/%@/%@,%@?exclude=minutely,hourly,alerts,flags";
    return weatherURL;
}

-(NSString*) gApiKey
{
    if(!gApiKey)
        gApiKey = @"AIzaSyD-HMhoKtAz7xJrMMYS2zBz3Mx_tGks3q4";
    return gApiKey;
}

-(NSString*) weatherApiKey
{
    if(!weatherApiKey)
        weatherApiKey = @"d3500e1675ddfc52d95543aea38d1441";
    return weatherApiKey;
}

-(NSString*) hotelKey
{
    if(!hotelKey)
        hotelKey = @"hotel";
    return hotelKey;
}

-(NSString*) weatherKey
{
    if(!weatherKey)
        weatherKey = @"weather";
    return weatherKey;
}

-(NSString *) TimeFormatThread
{
    return @"EEE";
}

-(NSString *) DayFormatThread
{
    return @"EEEE";
}
@end
