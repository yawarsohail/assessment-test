//
//  ViewController.h
//  assessment-test
//
//  Created by Guest on 10/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebrequestUIUpdateProtocol.h"
@interface ViewController : UIViewController<WebrequestUIUpdateProtocol>

- (IBAction)actionHotel:(id)sender;
- (IBAction)actionWeather:(id)sender;

@end

