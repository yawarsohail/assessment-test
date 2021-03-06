//
//  Utilities.m
//  assessment-test
//
//  Created by Guest on 11/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//

#import "Utilities.h"
#import <Reachability/Reachability.h>

@implementation Utilities

static Utilities *utilities=nil;


+(void) initialize
{
    if(self == [Utilities class])
        utilities=[[Utilities alloc] init];
}
+(Utilities *) Instance
{
    return utilities;
}

-(BOOL) isConnected{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    NetworkStatus status = [reachability currentReachabilityStatus];
    
    if(status == NotReachable)
    {
        return false;
    }
    else if (status == ReachableViaWiFi)
    {
        return true;
    }
    else if (status == ReachableViaWWAN)
    {
        return true;
    }
    return false;
}

-(NSString *)getDateFromString:(NSString*)timeStamp format:(NSString *)format{
    double unixTimeStamp = [timeStamp doubleValue];
    NSTimeInterval _interval=unixTimeStamp;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    
    NSString *Formatter =format;
    NSDateFormatter *outputDateFormatter = [[NSDateFormatter alloc] init];
    [outputDateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    [outputDateFormatter setDateFormat:Formatter];
    NSString *outputString = [outputDateFormatter stringFromDate:date];
    return outputString;
}

-(NSString*) setValue:(NSDictionary*)dictionary forKey:(NSString*)key replaceWith:(NSString*)replaceWith {
    return ([dictionary objectForKey:key] == (id)[NSNull null] || [dictionary objectForKey:key] == nil) ? replaceWith : [NSString stringWithFormat:@"%@",[dictionary objectForKey:key]];
}

@end
