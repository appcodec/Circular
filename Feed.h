//
//  Feed.h
//  Circular
//
//  Created by Codec on 7/14/56 BE.
//  Copyright (c) 2556 Codec. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Feed : NSObject

@property (nonatomic,assign) Boolean isPost;
@property (nonatomic,assign) Boolean withImage;
@property (nonatomic,retain) NSString * provider_name;
@property (nonatomic,retain) NSString * description;
@property (nonatomic,retain) NSString * image;

- (id)initWithFeed:(Feed*)myFeed;
- (id)initWithProvider:(NSString*)provider_name withDescription:(NSString*)description withImage:(NSString*)image isPost:(Boolean)postValue withImage:(Boolean)imageValue;


@end
