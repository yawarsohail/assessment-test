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

-(NSString*) gApiKey
{
    if(!gApiKey)
        gApiKey = @"AIzaSyD-HMhoKtAz7xJrMMYS2zBz3Mx_tGks3q4";
    return gApiKey;
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

//https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=CmRaAAAA_A6r5wvMYAgOMaDR136FZDN-bgeig07dZB5xZM9E-uONuvdQ0weyqk4rFGEB_qA2qJ2v0QU3Cg6imjocPWmfqUNJrWvYvoatsgHplt3umQTJ8cJGzTZEs2CsfCe8OjZdEhCiIzIs41_4lzXUeClierWKGhRF0rts0IZy_sFAT6ebTv8jDzLQ4A&key=AIzaSyD-HMhoKtAz7xJrMMYS2zBz3Mx_tGks3q4

@end
