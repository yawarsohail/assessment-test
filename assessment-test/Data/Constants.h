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
    NSString *gApiKey;
    NSString *hotelKey;
    NSString *weatherKey;
}

@property (readonly, nonatomic, retain) NSString *hotelURL;
@property (readonly, nonatomic, retain) NSString *gApiKey;
@property (readonly, nonatomic, retain) NSString *hotelKey;
@property (readonly, nonatomic, retain) NSString *weatherKey;

+(Constants *) Instance;
@end
