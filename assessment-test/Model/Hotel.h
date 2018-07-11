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
    NSString *_place;
    NSString *_photo;
}

@property (copy) NSString *name;
@property (copy) NSNumber *stars;
@property (copy) NSString *place;
@property (copy) NSString *photo;

-(void) setHotelFrom:(NSDictionary *) dictionary;
+(NSArray*) getFiveStarHotels:(NSMutableArray*)hotels;

@end
