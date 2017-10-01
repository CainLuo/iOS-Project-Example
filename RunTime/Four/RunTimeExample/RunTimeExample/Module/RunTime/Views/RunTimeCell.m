//
//  RunTimeCell.m
//  RunTimeExample
//
//  Created by Cain on 2017/9/26.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "RunTimeCell.h"

@implementation RunTimeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        self.textLabel.font = [UIFont systemFontOfSize:[UIScreen cl_fitScreen:30]];
    }
    
    return self;
}

- (void)cl_confgiRunTimeCellWithModel:(RunTimeModel *)model {
    
    if (model) {
        
        self.textLabel.text = model.cl_titleString;
    }
}

@end
