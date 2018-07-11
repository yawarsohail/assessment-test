//
//  Hotel.m
//  assessment-test
//
//  Created by Guest on 11/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//

#import "Hotel.h"
#import "Utilities.h"
#import "Constants.h"

@implementation Hotel
@synthesize name=_name;
@synthesize stars=_stars;
@synthesize place=_place;
@synthesize photo=_photo;

-(NSString*) getHotelName {
    return _name;
}
-(NSNumber*) getHotelStars {
    return _stars;
}
-(NSString*) getHotelPlace {
    return _place;
}
-(NSString*) getPhotoId {
    return _photo;
}
-(NSString*) getHotelPhoto {
    if ([_photo isEqualToString:@""]) {
        return @"";
    }
    return [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=%@&key=%@", _photo, [[Constants Instance] gApiKey]];
}

-(void) setHotelFrom:(NSDictionary *) dictionary {
    _name = [[Utilities Instance] setValue:dictionary forKey:@"name" replaceWith:@""];
    _stars = [dictionary objectForKey:@"rating"];
    _stars = [NSNumber numberWithDouble:5.0];
    _place = [[Utilities Instance] setValue:dictionary forKey:@"vicinity" replaceWith:@""];
    _photo = @"";
    NSArray* places = [dictionary objectForKey:@"photos"];
    if ([places count] > 0) {
        NSDictionary* place = [places objectAtIndex:0];
        _photo = [[Utilities Instance] setValue:place forKey:@"photo_reference" replaceWith:@""];
    }
}

+(NSArray*) getFiveStarHotels:(NSMutableArray*)hotels {
    // TODO: Return hotels after filtering
    NSPredicate *fiveOnly = [NSPredicate predicateWithBlock:
                            ^BOOL(Hotel* evalObject,NSDictionary * options) {
                                return evalObject.stars == [NSNumber numberWithDouble:5.0];
                            }];
    NSArray* hotel = [hotels filteredArrayUsingPredicate:fiveOnly];
    return hotel;
}
@end
