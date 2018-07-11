//
//  HotelTableViewCell.h
//  assessment-test
//
//  Created by Guest on 11/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebrequestUIUpdateProtocol.h"
#import "HotelProtocol.h"

@interface HotelTableViewCell : UITableViewCell<WebrequestUIUpdateProtocol>
@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UILabel *mainLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
-(void) customizeCellWithData:(id<HotelProtocol>)data;
@end
