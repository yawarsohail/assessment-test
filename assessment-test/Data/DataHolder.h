//
//  DataHolder.h
//  assessment-test
//
//  Created by Guest on 11/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataHolder : NSObject {

NSMutableArray *hotels;
}
@property (nonatomic, retain) NSMutableArray *hotels;

+(DataHolder *) Instance;

@end
