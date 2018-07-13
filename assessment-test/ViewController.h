//
//  ViewController.h
//  assessment-test
//
//  Created by Guest on 10/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebrequestUIUpdateProtocol.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<WebrequestUIUpdateProtocol>

@property (retain,nonatomic) NSString *countryName;
@property (nonatomic) BOOL isHotel;
- (IBAction)actionHotel:(id)sender;
- (IBAction)actionWeather:(id)sender;

@end

