//
//  ViewController.m
//  assessment-test
//
//  Created by Guest on 10/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//

#import "ViewController.h"
#import "DataCenter.h"
#import "DataHolder.h"
#import "Constants.h"
#import "Hotel.h"
#import "HotelViewController.h"
#import "WeatherViewController.h"
#import "MBProgressHUD.h"

@interface ViewController ()<CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Home"];
    self.locationManager = [[CLLocationManager alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)actionHotel:(id)sender {
    self.isHotel = YES;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.locationManager.delegate = self;
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
}

- (IBAction)actionWeather:(id)sender {
    self.isHotel = NO;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.locationManager.delegate = self;
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
}

-(void) responseFromWServer:(NSDictionary *)response withIdentifier:(NSString *)identifier{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    if ([identifier isEqualToString:[[Constants Instance] hotelKey]]) {
        // TODO: filter only hotels with 5 star rating.
        [self performSegueWithIdentifier:@"showhotelsegue" sender:self];
    }
    else if ([identifier isEqualToString:[[Constants Instance] weatherKey]]) {
        [self performSegueWithIdentifier:@"showweathersegue" sender:self];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"showhotelsegue"]) {
        NSArray* hotels = [Hotel getFiveStarHotels:[DataHolder Instance].hotels];
        HotelViewController *nextViewController = segue.destinationViewController;
        nextViewController.passedInfo = hotels;
    }
    else if([[segue identifier] isEqualToString:@"showweathersegue"]) {
        WeatherViewController *nextViewController = segue.destinationViewController;
        nextViewController.passedInfo = [DataHolder Instance].weathers;
        nextViewController.countryName = self.countryName;
    }
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if(status == kCLAuthorizationStatusAuthorizedWhenInUse){
        
    }else if(status == kCLAuthorizationStatusNotDetermined || status == kCLAuthorizationStatusDenied){
        [manager requestWhenInUseAuthorization];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                 message:@"Failed to Get Your Location"
                                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
    [errorAlert addAction:action];
    [self presentViewController:errorAlert animated:YES completion:nil];
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    CLLocation *currentLocation = [locations lastObject];
    if (currentLocation != nil) {
        [self.locationManager stopUpdatingLocation];
        self.locationManager.delegate = nil;
        NSString* lon = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        NSString* lat = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error)
         {
             if (!(error))
             {
                 CLPlacemark *placemark = [placemarks objectAtIndex:0];
                 NSLog(@"\nCurrent Location Detected\n");
                 NSLog(@"placemark %@",placemark);
                 
                 self.countryName = placemark.country;
             }
             else
             {
                 NSLog(@"Geocode failed with error %@", error);
                 NSLog(@"\nCurrent Location Not Detected\n");
             }
             
             if (self.isHotel) {
                 [[DataCenter Instance] getHotels:lat lng:lon delegate:self];
             }
             else {
                 [[DataCenter Instance] getWeather:lat lng:lon delegate:self];
             }
         }];
        
    }
}
@end
