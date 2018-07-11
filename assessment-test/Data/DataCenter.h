//
//  DataCenter.h
//  assessment-test
//
//  Created by Guest on 11/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebrequestUIUpdateProtocol.h"

@interface DataCenter : NSObject

+(DataCenter *) Instance;

-(void) getHotels:(NSString *) lat lng:(NSString*)lng delegate:(id<WebrequestUIUpdateProtocol>) delegate;
@end
