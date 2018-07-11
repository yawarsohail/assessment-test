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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)actionHotel:(id)sender {
    // TODO : Use location to get lat, lng.
    [[DataCenter Instance] getHotels:@"24.8607" lng:@"67.0011" delegate:self];
}

- (IBAction)actionWeather:(id)sender {
}

-(void) responseFromWServer:(NSDictionary *)response withIdentifier:(NSString *)identifier{
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
    }
}

@end
