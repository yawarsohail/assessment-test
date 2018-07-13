//
//  WeatherViewController.m
//  assessment-test
//
//  Created by Guest on 10/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//

#import "WeatherViewController.h"
#import "WeatherProtocol.h"

@interface WeatherViewController ()

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Weather"];
    [self showUIData];
    // Do any additional setup after loading the view.
}

-(void)showUIData {
    [self.CountryNameLabel setText:self.countryName];
    id<WeatherProtocol> current = self.passedInfo[0];
    [self.dayLabel setText:[current getDay]];
    [self.detailLabel setText:[current getDetail]];
    [self.currentIcon setImage:[UIImage imageNamed:[current getIcon]]];
    [self.currentTemprature setText:[NSString stringWithFormat:@"%@", [current getTemp]]];
    [self.preciLabel setText:[current getPrecip]];
    [self.humidityLabel setText:[current getHumidity]];
    [self.windLabel setText:[current getWind]];
    
    for (int i=0; i<[self.passedInfo count]-1; i++) {
        id<WeatherProtocol> w = self.passedInfo[i+1];
        [(UILabel*)self.daysLabel[i] setText:[NSString stringWithFormat:@"%@", [w getTime]]];
        [(UILabel*)self.tempLabels[i] setText:[NSString stringWithFormat:@"%@°|%@°", [w getTempLow],[w getTempHigh]]];
        [(UIImageView*)self.iconImages[i] setImage:[UIImage imageNamed:[w getIcon]]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
