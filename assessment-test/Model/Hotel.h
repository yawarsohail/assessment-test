//
//  Hotel.h
//  assessment-test
//
//  Created by Guest on 11/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HotelProtocol.h"

@interface Hotel : NSObject<HotelProtocol> {
    NSString *_name;
    NSNumber *_stars;
}

@property (copy) NSString *name;
@property (copy) NSNumber *stars;

-(void) setHotelFrom:(NSDictionary *) dictionary;
+(NSArray*) getFiveStarHotels:(NSMutableArray*)hotels;

@end
