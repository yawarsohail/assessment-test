//
//  HotelTableViewCell.m
//  assessment-test
//
//  Created by Guest on 11/07/2018.
//  Copyright © 2018 Guest. All rights reserved.
//

#import "HotelTableViewCell.h"
#import "DataCenter.h"

@implementation HotelTableViewCell
id<HotelProtocol> mydata;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void) customizeCellWithData:(id<HotelProtocol>)data {
    mydata = data;
    [self.mainLabel setText:[data getHotelName]];
    NSString* url = [data getHotelPhoto];
    self.imgView.image = [UIImage imageNamed:@"avatar"];
    UIImage *img = [[DataCenter Instance] getImageFromUrlOrCache:url fileName:[data getPhotoId] delegate:self];
    if(img != nil)
        self.imgView.image = img;
}

-(void) updateImage:(UIImage *)image identifier:(NSString *)identifier {
    if([identifier isEqualToString:[mydata getPhotoId]]) {
        [self.imgView setContentMode:UIViewContentModeScaleAspectFit];
        [self.imgView setImage:image];
    }
}
@end
