//
//  DataCenter.m
//  assessment-test
//
//  Created by Guest on 11/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//

#import "DataCenter.h"
#import "ASIFormDataRequest.h"
#import "Utilities.h"
#import "Constants.h"
#import "Hotel.h"
#import "DataHolder.h"

@implementation DataCenter
static DataCenter *dataCenter=nil;

+(void) initialize
{
    if(self == [DataCenter class])
        dataCenter=[[DataCenter alloc] init];
}

+(DataCenter *) Instance
{
    return dataCenter;
}

-(void) getHotels:(NSString *) lat lng:(NSString*)lng delegate:(id<WebrequestUIUpdateProtocol>) delegate
{
    if([[Utilities Instance] isConnected]){
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:[Constants Instance].hotelURL,lat,lng,[Constants Instance].gApiKey]];
        ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
        [request setDelegate:self];
        if(delegate !=nil){
            [request setUserInfo:[NSDictionary dictionaryWithObject:delegate forKey:@"delegate"]];
        }
        [request setDidFinishSelector:@selector(getHotelsResponse:)];
        [request startAsynchronous];
    }
}

- (void)getHotelsResponse:(ASIFormDataRequest *)request {
    // Use when fetching text data
    NSString *responseString = [request responseString];
    NSLog(@"%@",responseString);
    NSData *data = [responseString dataUsingEncoding:NSUTF8StringEncoding];
    id response = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    [DataHolder Instance].hotels = [[NSMutableArray alloc] init];
    NSArray* hotels = [response objectForKey:@"results"];
    for(int n = 0; n < [hotels count]; n++)
    {
        NSDictionary* hotel = [hotels objectAtIndex:n];
        Hotel* myHotel = [[Hotel alloc] init];
        [myHotel setHotelFrom:hotel];
        [[DataHolder Instance].hotels addObject:myHotel];
    }
    
    NSLog(@"%@",[response objectForKey:@"Status"]);
    if([[request userInfo] objectForKey:@"delegate"]!=nil){
        id delegate = [[request userInfo] objectForKey:@"delegate"];
        [delegate responseFromWServer:response withIdentifier:[[Constants Instance] hotelKey] ];
    }
}

@end
