//
//  WeatherProtocol.h
//  assessment-test
//
//  Created by Guest on 12/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//

#ifndef WeatherProtocol_h
#define WeatherProtocol_h


#endif /* WeatherProtocol_h */


@protocol WeatherProtocol <NSObject>

-(NSString*) getTime;
-(NSString*) getDay;
-(NSString*) getTemp;
-(NSString*) getTempLow;
-(NSString*) getTempHigh;
-(NSNumber*) getHumidity;
-(NSNumber*) getPrecip;
-(NSNumber*) getWind;
-(NSString*) getIcon;
-(NSString*) getDetail;

@end
