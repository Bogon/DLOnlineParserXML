//
//  DLNoteUnfoldInfomation.m
//  DLOnlineParserXML
//
//  Created by Char on 2016/12/15.
//  Copyright © 2016年 zhangqi. All rights reserved.
//

#import "DLNoteUnfoldInfomation.h"

@implementation DLNoteUnfoldInfomation

- (void)setModel:(DLNoteInfomation *)model{
    _model = model;
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    CGFloat margin = 8;
    CGFloat contentLabel = cellW - 2*margin;
    CGFloat contentH = [model.notemsg boundingRectWithSize:CGSizeMake(contentLabel, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
    CGFloat onelineH = [@"" boundingRectWithSize:CGSizeMake(contentLabel, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;

    CGFloat btnH = 0;
    if (!model.isUnflod) {
        if (contentH >= 3*onelineH) {
            contentH = 3*onelineH;
            btnH = 20;
        }else{
            btnH = 0;
        }
    }else{
        btnH = 20;
    }

    self.contentF = CGRectMake(margin, margin, contentLabel, contentH);

    CGFloat btnW = 50;
    CGFloat cellMaxH = 0;
    if (btnH == 0) {//只有一行
        self.unflodBtnF = CGRectZero;
        cellMaxH = CGRectGetMaxY(self.contentF)+margin;
    }else{

        self.unflodBtnF = CGRectMake(cellW-btnW-margin, CGRectGetMaxY(self.contentF), btnW, 20);
        cellMaxH = CGRectGetMaxY(self.unflodBtnF)-margin;
    }

    self.cellH = cellMaxH+margin;

}

@end
