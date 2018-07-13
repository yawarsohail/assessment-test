//
//  Utilities.h
//  assessment-test
//
//  Created by Guest on 11/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utilities : NSObject

+(Utilities *) Instance;
-(BOOL) isConnected;
-(NSString *)getDateFromString:(NSString*)timeStamp format:(NSString *)format;
-(NSString*) setValue:(NSDictionary*)dictionary forKey:(NSString*)key replaceWith:(NSString*)replaceWith ;
@end
