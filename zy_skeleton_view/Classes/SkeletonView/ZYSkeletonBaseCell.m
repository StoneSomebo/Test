//
//  ZYSkeletonBaseCell.m
//  tieba
//
//  Created by zuiyou on 2019/4/9.
//  Copyright © 2019年 XiaoChuan Technology Co.,Ltd. All rights reserved.
//

#import "ZYSkeletonBaseCell.h"
#import "FBShimmeringView.h"
#import "ZYSkeletonModel.h"

@interface ZYSkeletonBaseCell ()

@property (nonatomic, strong) FBShimmeringView *shimmeringView;
@property (nonatomic, strong) UIView *avatarView;
@property (nonatomic, strong) UIView *firstLine;
@property (nonatomic, strong) UIView *secondLine;
@property (nonatomic, strong) UIView *thirdLine;

@end


@implementation ZYSkeletonBaseCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setupSubViews {
    
    _shimmeringView = [[FBShimmeringView alloc] initWithFrame:CGRectZero];
    _shimmeringView.shimmering = YES;
    _shimmeringView.shimmeringBeginFadeDuration = 0.3;
    _shimmeringView.shimmeringOpacity = 0.3;
    _shimmeringView.shimmeringSpeed = 300;
    [self addSubview:_shimmeringView];
    
    _avatarView = [[UIView alloc] initWithFrame:CGRectZero];
    _avatarView.dk_backgroundColorPicker = ZYColorPicker_CB;
    [self addSubview:_avatarView];
    
    _firstLine = [[UIView alloc] initWithFrame:CGRectZero];
    _firstLine.dk_backgroundColorPicker = ZYColorPicker_CB;
    [self addSubview:_firstLine];
    
    _secondLine = [[UIView alloc] initWithFrame:CGRectZero];
    _secondLine.dk_backgroundColorPicker = ZYColorPicker_CB;
    [self addSubview:_secondLine];
    
    _thirdLine = [[UIView alloc] initWithFrame:CGRectZero];
    _thirdLine.dk_backgroundColorPicker = ZYColorPicker_CB;
    [self addSubview:_thirdLine];
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    contentView.dk_backgroundColorPicker = DKColorPickerWithColors([UIColor colorWithHexString:@"CCCCCC"],[UIColor colorWithHexString:@"CCCCCC"]);
    _shimmeringView.contentView = contentView;
    
}

#pragma mark API

+ (CGFloat)cellHeightWithModel:(ZYSkeletonModel *)model {
    if (model.type == ZYSkeletonHeadView) {
        return 160;
    } else {
        return 80;
    }
}

- (void)configViewWithModel:(ZYSkeletonModel *)model {
    if (model.type == ZYSkeletonHeadView) {
        _shimmeringView.frame = CGRectMake(0, 0, kScreenWidth, [[self class] cellHeightWithModel:model]);
        _avatarView.frame = CGRectMake(kZYCommonLeftMargin, kZYCommonTopMargin, kCommentCellCardUserAvaterSide, kCommentCellCardUserAvaterSide);
        _avatarView.layer.cornerRadius = _avatarView.height / 2;
        _avatarView.layer.masksToBounds = YES;
        _firstLine.frame = CGRectMake(_avatarView.left, _avatarView.bottom + kZYCommonBottomMargin, kScreenWidth - 90 * kScreenWidth / 375, 15);
        _secondLine.frame = CGRectMake(_avatarView.left, _firstLine.bottom + kZYCommonBottomMargin, kScreenWidth - 90 * kScreenWidth / 375, 15);
        _thirdLine.frame = CGRectMake(_avatarView.left, _secondLine.bottom + kZYCommonBottomMargin, kScreenWidth - 90 * kScreenWidth / 375, 15);
    } else {
        _shimmeringView.frame = CGRectMake(0, 0, kScreenWidth, [[self class] cellHeightWithModel:model]);
        _avatarView.frame = CGRectMake(kZYCommonLeftMargin, kZYCommonTopMargin, kCommentCellCardUserAvaterSide, kCommentCellCardUserAvaterSide);
        _avatarView.layer.cornerRadius = _avatarView.height / 2;
        _avatarView.layer.masksToBounds = YES;
        _firstLine.frame = CGRectMake(_avatarView.right + 10, kCommentCellCardTopMargin, kScreenWidth - _avatarView.right - 90 * kScreenWidth / 375, 10);
        _secondLine.frame = CGRectMake(_avatarView.right + 10, _firstLine.bottom + 10, kScreenWidth - _avatarView.right - 90 * kScreenWidth / 375, 10);
        _thirdLine.frame = CGRectMake(_avatarView.right + 10, _secondLine.bottom + 10, kScreenWidth - _avatarView.right - 90 * kScreenWidth / 375, 10);
    }
}



@end
