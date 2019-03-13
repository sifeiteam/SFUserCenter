//
//  SFUserHeaderCell.m
//  SFUserCenter
//
//  Created by XJY on 2019/3/13.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import "SFUserHeaderCell.h"

@interface SFUserHeaderCell ()

@property (nonatomic, strong) UIImageView *backgroundImageView;

@property (nonatomic, strong) UIImageView *headerImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation SFUserHeaderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createUI];
    }
    return self;
}

- (void)createUI {
    
}

@end
