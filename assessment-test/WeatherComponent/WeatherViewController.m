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
    [self.CountryNameLabel setText:self.countryName];
    id<WeatherProtocol> current = self.passedInfo[0];
    [self.dayLabel setText:[current getDay]];
    [self.detailLabel setText:[current getDetail]];
    [self.currentIcon setImage:[UIImage imageNamed:[current getIcon]]];
    [self.currentTemprature setText:[NSString stringWithFormat:@"%@", [current getTemp]]];
    
    
    for (int i=0; i<[self.passedInfo count]-1; i++) {
        id<WeatherProtocol> w = self.passedInfo[i+1];
        [(UILabel*)self.daysLabel[i] setText:[NSString stringWithFormat:@"%@", [w getTime]]];
        [(UILabel*)self.tempLabels[i] setText:[NSString stringWithFormat:@"%@°|%@°", [w getTempLow],[w getTempHigh]]];

        [(UIImageView*)self.iconImages[i] setImage:[UIImage imageNamed:[w getIcon]]];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
