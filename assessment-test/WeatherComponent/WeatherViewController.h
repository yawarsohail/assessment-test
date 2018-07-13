//
//  WeatherViewController.h
//  assessment-test
//
//  Created by Guest on 10/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *CountryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *currentIcon;
@property (weak, nonatomic) IBOutlet UILabel *currentTemprature;
@property (weak, nonatomic) IBOutlet UILabel *Value;
@property (weak, nonatomic) IBOutlet UILabel *preciLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;

@property (retain,nonatomic) NSArray *passedInfo;
@property (retain,nonatomic) NSString *countryName;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *daysLabel;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *tempLabels;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *iconImages;

@end
