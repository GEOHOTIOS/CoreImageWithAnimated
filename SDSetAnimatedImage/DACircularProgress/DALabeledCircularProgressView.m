//
//  DALabeledCircularProgressView.m
//  DACircularProgressExample
//
//  Created by Josh Sklar on 4/8/14.
//  Copyright (c) 2014 Shout Messenger. All rights reserved.
//

#import "DALabeledCircularProgressView.h"

@implementation DALabeledCircularProgressView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeLabel];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initializeLabel];
    }
    return self;
}


#pragma mark - Internal methods

/**
 Creates and initializes
 -[DALabeledCircularProgressView progressLabel].
 */

+ (void)setProgressLabel:(NSString *)LabelString{
   return [[self alloc]setProgressStr:LabelString];
}
- (void)setProgressStr:(NSString *)String{
    self.progressLabel.textColor = [UIColor blackColor];
    self.progressLabel.font = [UIFont systemFontOfSize:12];
    [self.progressLabel setText:String];
}

- (void)initializeLabel
{
    self.progressLabel = [[UILabel alloc] initWithFrame:self.bounds];
    self.progressLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.progressLabel.textAlignment = NSTextAlignmentCenter;
    self.progressLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.progressLabel];
}

@end
