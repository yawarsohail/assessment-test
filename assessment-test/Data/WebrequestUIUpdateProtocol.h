//
//  WebrequestUIUpdateProtocol.h
//  assessment-test
//
//  Created by Guest on 11/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//
#import <ASIHTTPRequest.h>
#ifndef WebrequestUIUpdateProtocol_h
#define WebrequestUIUpdateProtocol_h


#endif /* WebrequestUIUpdateProtocol_h */


@protocol WebrequestUIUpdateProtocol <NSObject>

@optional
-(void) responseFromWServer:(NSDictionary *)responseDict withIdentifier:(NSString *)identifier;

@optional
-(void) updateImage:(UIImage *)image identifier:(NSString *)identifier;

@end


