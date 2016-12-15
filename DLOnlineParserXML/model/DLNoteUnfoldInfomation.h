//
//  DLNoteUnfoldInfomation.h
//  DLOnlineParserXML
//
//  Created by Char on 2016/12/15.
//  Copyright © 2016年 zhangqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DLNoteInfomation.h"

@interface DLNoteUnfoldInfomation : NSObject

@property (nonatomic, strong)   DLNoteInfomation *model;

@property (nonatomic,assign)    CGRect contentF;

@property (nonatomic,assign)    CGRect unflodBtnF;

@property (nonatomic,assign)    CGFloat cellH;

@end
