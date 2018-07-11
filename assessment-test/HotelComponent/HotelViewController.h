//
//  HotelViewController.h
//  assessment-test
//
//  Created by Guest on 10/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotelViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (retain,nonatomic) NSArray *passedInfo;
@property (weak, nonatomic) IBOutlet UITableView *hotelTableView;
@end
