//
//  Feed.m
//  Circular
//
//  Created by Codec on 7/14/56 BE.
//  Copyright (c) 2556 Codec. All rights reserved.
//

#import "Feed.h"

@implementation Feed

- (id)init
{
    self = [super init];
    if (self) {
        _isPost = false;
        _withImage = false;
        _provider_name = [[NSString alloc] init];
        _description = [[NSString alloc] init];
        _image = [[NSString alloc] init];
    }
    return self;
}

- (id)initWithProvider:(NSString*)provider_name withDescription:(NSString*)description withImage:(NSString*)image isPost:(Boolean)postValue withImage:(Boolean)imageValue{
    self = [super init];
    if (self) {
        _isPost = postValue;
        _withImage = imageValue;
        _provider_name = provider_name;
        _description = description;
        _image = image;
    }
    return self;
} 

- (id)initWithFeed:(Feed*)myFeed{
    self = [super init];
    if (self) {
        _isPost = [myFeed isPost];
        _withImage = [myFeed withImage];
        _provider_name = [myFeed provider_name];
        _description = [myFeed description];
        _image = [myFeed image];
    }
    return self;
}



@end
