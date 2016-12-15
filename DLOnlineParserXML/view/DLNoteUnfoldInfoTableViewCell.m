//
//  DLNoteUnfoldInfoTableViewCell.m
//  DLOnlineParserXML
//
//  Created by Char on 2016/12/15.
//  Copyright © 2016年 zhangqi. All rights reserved.
//

#import "DLNoteUnfoldInfoTableViewCell.h"

@interface DLNoteUnfoldInfoTableViewCell ()

@property (nonatomic,weak)UILabel * contentLabel;
@property (nonatomic,weak)UIButton * unfoldBtn;

@end


@implementation DLNoteUnfoldInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setFrameModel:(DLNoteUnfoldInfomation *)frameModel{
    _frameModel = frameModel;
    DLNoteInfomation *model = frameModel.model;
    self.contentLabel.frame = frameModel.contentF;
    self.contentLabel.text = model.notemsg;
    self.unfoldBtn.frame = frameModel.unflodBtnF;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *contentLabel = [[UILabel alloc] init];
        [self.contentView addSubview:contentLabel];
        self.contentLabel = contentLabel;
        contentLabel.font = [UIFont systemFontOfSize:16];
        contentLabel.numberOfLines = 0;
        contentLabel.userInteractionEnabled = YES;

        UIGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(unflodCell)];
        [contentLabel addGestureRecognizer:tap];

        UIButton *unfoldBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.unfoldBtn = unfoldBtn;
        [self.contentView addSubview:unfoldBtn];
        [unfoldBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [unfoldBtn addTarget:self action:@selector(unflodCell) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}



- (void)unflodCell{
    if ([self.delegate respondsToSelector:@selector(UnfoldCellDidClickUnfoldBtn:)]) {
        [self.delegate UnfoldCellDidClickUnfoldBtn:self.frameModel];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
