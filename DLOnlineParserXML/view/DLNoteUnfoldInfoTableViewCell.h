//
//  DLNoteUnfoldInfoTableViewCell.h
//  DLOnlineParserXML
//
//  Created by Char on 2016/12/15.
//  Copyright © 2016年 zhangqi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DLNoteUnfoldInfomation.h"
#import "DLNoteInfomation.h"

@class DLNoteUnfoldInfomation;

@protocol UnfoldDelegate <NSObject>

-(void)UnfoldCellDidClickUnfoldBtn:(DLNoteUnfoldInfomation *)model;

@end


@interface DLNoteUnfoldInfoTableViewCell : UITableViewCell

@property (nonatomic,strong)DLNoteUnfoldInfomation *frameModel;
@property (nonatomic,weak)id<UnfoldDelegate>delegate;

@end
