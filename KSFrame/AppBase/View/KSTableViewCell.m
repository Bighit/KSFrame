	//
//  KSTableViewCell.m
//  KSFrame
//
//  Created by JoyTouch9 on 15-1-16.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "KSTableViewCell.h"
@interface KSTableViewCellView : UIView
@end
@implementation KSTableViewCellView

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        self.opaque = YES;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.contentMode = UIViewContentModeRedraw;
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    KSTableViewCell *cell = (KSTableViewCell *)[self superview];
    if (cell.highlighted == NO) {
        [super drawRect:rect];
    }
    [cell drawContentView:rect];
}

@end


@implementation KSTableViewCell


#pragma mark UIView

- (void)setNeedsDisplay {
    [super setNeedsDisplay];
    [_cellView setNeedsDisplay];
}


- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    _cellView.frame = [self cellViewFrame];
    [self setNeedsDisplay];
}


#pragma mark UITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        self.backgroundView.hidden = YES;
        self.textLabel.hidden = YES;
        self.detailTextLabel.hidden = YES;
        self.imageView.hidden = YES;
        self.contentView.hidden = YES;
        
        _cellView = [[KSTableViewCellView alloc] initWithFrame:CGRectZero];
        [self addSubview:_cellView];
    }
    return self;
}


#pragma mark Custom Drawing

- (void)drawContentView:(CGRect)rect {
    // 子类实现
    
}


- (CGRect)cellViewFrame {
    return self.contentView.frame;
}

@end
