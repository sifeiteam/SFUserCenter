//
//  SFUserCenterCell.m
//  SFUserCenter
//
//  Created by XJY on 2019/3/13.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import "SFUserCenterCell.h"

@interface SFUserCenterCell ()

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation SFUserCenterCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        [self createUI];
    }
    return self;
}

- (void)createUI {
    
}

@end
