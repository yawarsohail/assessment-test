//
//  Hotel.m
//  assessment-test
//
//  Created by Guest on 11/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//

#import "Hotel.h"
#import "Utilities.h"

@implementation Hotel
@synthesize name=_name;
@synthesize stars=_stars;

-(NSString*) getHotelName {
    return _name;
}

-(void) setHotelFrom:(NSDictionary *) dictionary {
    _name = [[Utilities Instance] setValue:dictionary forKey:@"name" replaceWith:@""];
    _stars = [dictionary objectForKey:@"rating"];
    NSString *rating = [[Utilities Instance] setValue:dictionary forKey:@"rating" replaceWith:@"0"];
}

+(NSArray*) getFiveStarHotels:(NSMutableArray*)hotels
{
    // TODO: Return hotels after filtering
    return hotels;
}
@end
