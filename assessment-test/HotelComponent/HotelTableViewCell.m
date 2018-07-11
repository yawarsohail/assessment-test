//
//  HotelTableViewCell.m
//  assessment-test
//
//  Created by Guest on 11/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//

#import "HotelTableViewCell.h"

@implementation HotelTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void) customizeCellWithData:(id<HotelProtocol>)data
{
    [self.mainLabel setText:[data getHotelName]];
    
}

@end
