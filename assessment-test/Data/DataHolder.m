//
//  DataHolder.m
//  assessment-test
//
//  Created by Guest on 11/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//

#import "DataHolder.h"

@implementation DataHolder
@synthesize hotels;
static DataHolder *dataHolder=nil;
+(void) initialize
{
    if(self == [DataHolder class])
        dataHolder=[[DataHolder alloc] init];
}

+(DataHolder *) Instance
{
    return dataHolder;
}
@end
