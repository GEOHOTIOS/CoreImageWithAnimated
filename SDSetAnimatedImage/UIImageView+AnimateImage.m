//
//  UIImageView+AnimateImage.m
//  SDSetAnimatedImage
//
//  Created by Wiseb2b002 on 16/7/28.
//  Copyright © 2016年 JobsTorvalds. All rights reserved.
//

#import "UIImageView+AnimateImage.h"
#import "UIImageView+WebCache.h"
#import "DALabeledCircularProgressView.h"

@implementation UIImageView (AnimateImage)

- (void)jt_setImageWithUrl:(NSString *)url
{
    [self sd_setImageWithURL:[NSURL URLWithString:url]];
}

- (void)jt_setImageWithUrl:(NSString *)url placeholderImage:(UIImage *)placeholder
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder];
}

- (void)jt_setImageWithURL:(NSString *)url placeholderImage:(UIImage *)placeholder options:(JTWebImageOptions)options
{
    NSInteger option = options;
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder options:option];
}

- (void)jt_setImageWithURL:(NSString *)url completed:(SDWebImageCompletionBlock)completedBlock
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] completed:completedBlock];
}


- (void)jt_setImageWithURL:(NSString *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:completedBlock];
}


- (void)jt_setImageWithURL:(NSString *)url placeholderImage:(UIImage *)placeholder options:(JTWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock
{
    NSInteger option = options;
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder options:option completed:completedBlock];
}

- (void)jt_setImageWithURL:(NSString *)url placeholderImage:(UIImage *)placeholder Animated:(BOOL)animated trackTintColor:(UIColor*)trackTintColor progressTintColor:(UIColor *)progressTintColor innerTintColor:(UIColor *)innerTintColor frame:(CGRect)frame options:(JTWebImageOptions)options  progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock
{
    NSInteger option = options;
    if (animated) {
        __block DALabeledCircularProgressView *pv;
        [pv removeFromSuperview];
        pv = [[DALabeledCircularProgressView alloc]initWithFrame:frame];
        pv.roundedCorners = YES;
        pv.trackTintColor = trackTintColor != nil ? trackTintColor : [UIColor colorWithRed:211.0/255.0 green:211.0/255.0 blue:211.0/255.0 alpha:1];
        pv.progressTintColor = progressTintColor != nil ? progressTintColor:[UIColor whiteColor];
        pv.innerTintColor = innerTintColor != nil ? innerTintColor : [UIColor colorWithRed:192.0/255.0 green:192.0/255.0 blue:192.0/255.0 alpha:1];
        [pv setProgress:0.0f];
        [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder options:option progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            pv.center = self.center;
            float curProgress = (float)receivedSize/expectedSize;
            long currentProgress = 100*receivedSize/expectedSize;
            pv.progressLabel.text = [NSString stringWithFormat:@"%ld%%",currentProgress];
            [pv setProgress:curProgress animated:YES];
            [self addSubview:pv];
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            [pv removeFromSuperview];
        }];
    }else{
        [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder options:option progress:progressBlock completed:completedBlock];
    }
}


- (void)jt_setImageWithPreviousCachedImageWithURL:(NSString *)url placeholderImage:(UIImage *)placeholder trackTintColor:(UIColor*)trackTintColor progressTintColor:(UIColor *)progressTintColor innerTintColor:(UIColor *)innerTintColor frame:(CGRect)frame options:(JTWebImageOptions)options Animated:(BOOL)animated progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock
{
    NSInteger option = options;
    if (animated) {
        __block DALabeledCircularProgressView *pv;
        [pv removeFromSuperview];
        pv = [[DALabeledCircularProgressView alloc]initWithFrame:frame];
        pv.roundedCorners = YES;
        pv.trackTintColor = trackTintColor != nil ? trackTintColor : [UIColor colorWithRed:211.0/255.0 green:211.0/255.0 blue:211.0/255.0 alpha:1];
        pv.progressTintColor = progressTintColor != nil ? progressTintColor:[UIColor whiteColor];
        pv.innerTintColor = innerTintColor != nil ? innerTintColor : [UIColor colorWithRed:192.0/255.0 green:192.0/255.0 blue:192.0/255.0 alpha:1];
        [pv setProgress:0.0f];
        [self sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder options:option progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            pv.center = self.center;
            float curProgress = (float)receivedSize/expectedSize;
            long currentProgress = 100*receivedSize/expectedSize;
            pv.progressLabel.text = [NSString stringWithFormat:@"%ld%%",currentProgress];
            [pv setProgress:curProgress animated:YES];
            [self addSubview:pv];
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            [pv removeFromSuperview];
        }];
    }else{
        [self sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder options:option progress:progressBlock completed:completedBlock];
    }
}





@end
