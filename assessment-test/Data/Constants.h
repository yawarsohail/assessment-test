//
//  Constants.h
//  assessment-test
//
//  Created by Guest on 11/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject {
    NSString *hotelURL;
    NSString *weatherURL;
    NSString *gApiKey;
    NSString *weatherApiKey;
    NSString *hotelKey;
    NSString *weatherKey;
    NSString *TimeFormatThread;
    NSString *DayFormatThread;
}

@property (readonly, nonatomic, retain) NSString *hotelURL;
@property (readonly, nonatomic, retain) NSString *weatherURL;
@property (readonly, nonatomic, retain) NSString *gApiKey;
@property (readonly, nonatomic, retain) NSString *weatherApiKey;
@property (readonly, nonatomic, retain) NSString *hotelKey;
@property (readonly, nonatomic, retain) NSString *weatherKey;
@property (readonly, nonatomic) NSString *TimeFormatThread;
@property (readonly, nonatomic) NSString *DayFormatThread;

+(Constants *) Instance;
@end
