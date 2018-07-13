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
#import "Weather.h"
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

-(void) getWeather:(NSString *) lat lng:(NSString*)lng delegate:(id<WebrequestUIUpdateProtocol>) delegate {
    if([[Utilities Instance] isConnected]){
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:[Constants Instance].weatherURL,[Constants Instance].weatherApiKey,lat,lng]];
        ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
        [request setRequestMethod:@"GET"];
        [request setDelegate:self];
        if(delegate !=nil){
            [request setUserInfo:[NSDictionary dictionaryWithObject:delegate forKey:@"delegate"]];
        }
        [request setDidFinishSelector:@selector(getWeatherResponse:)];
        [request startAsynchronous];
    }
}

- (void)getWeatherResponse:(ASIFormDataRequest *)request {
    // Use when fetching text data
    NSString *responseString = [request responseString];
    NSLog(@"%@",responseString);
    NSData *data = [responseString dataUsingEncoding:NSUTF8StringEncoding];
    id response = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    [DataHolder Instance].weathers = [[NSMutableArray alloc] init];
    NSDictionary* current = [response objectForKey:@"currently"];
    Weather* weather = [[Weather alloc] init];
    [weather setWeatherFrom:current];
    [[DataHolder Instance].weathers addObject:weather];
    NSDictionary* dailyObj = [response objectForKey:@"daily"];
    NSArray* daily = [dailyObj objectForKey:@"data"];
    for(int n = 1; n < 6; n++) {
        NSDictionary* weatherData = [daily objectAtIndex:n];
        Weather* weather = [[Weather alloc] init];
        [weather setWeatherFrom:weatherData];
        [[DataHolder Instance].weathers addObject:weather];
    }
    
    NSLog(@"%@",[response objectForKey:@"Status"]);
    if([[request userInfo] objectForKey:@"delegate"]!=nil){
        id delegate = [[request userInfo] objectForKey:@"delegate"];
        [delegate responseFromWServer:response withIdentifier:[[Constants Instance] weatherKey] ];
    }
}


-(UIImage*) getImageFromUrlOrCache:(NSString *)url fileName:(NSString *)fileName delegate:(id<WebrequestUIUpdateProtocol>)delegate{
    NSString* iden = fileName;
    if(url != nil && ![url isEqualToString:@""]){
        NSString* cachesDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        cachesDirectory = [cachesDirectory stringByAppendingString:@"/photos/"];
        
        BOOL isDir = NO;
        NSFileManager *manager = [NSFileManager defaultManager];
        [manager fileExistsAtPath:cachesDirectory isDirectory:&isDir];
        
        if(!isDir)
            [manager createDirectoryAtPath:cachesDirectory withIntermediateDirectories:YES attributes:nil error:NULL];
        
        fileName = [[url lastPathComponent] stringByDeletingPathExtension];
        NSString *file = [cachesDirectory stringByAppendingPathComponent:fileName];
        
        UIImage *img = [UIImage imageWithContentsOfFile:file];
        [delegate updateImage:img identifier:nil];
        
        if(img==nil){
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
                NSError *err;
                NSData *downloadedData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url] options:NSUncachedRead error:&err];
                if(err)
                    NSLog(@"Error  : %@",[err description]);
                if (downloadedData) {
                    [downloadedData writeToFile:file atomically:YES];
                    dispatch_async(dispatch_get_main_queue(), ^(){
                        if(delegate != nil) {
                            UIImage *newiImg = [UIImage imageWithData:downloadedData];
                            [delegate updateImage:newiImg identifier:iden];
                        }
                    });
                }
            });
        }
        return img;
    }
    return nil;
}

@end
