//
//  JEFPicture.m
//  Yugioh-Objc
//
//  Created by Jordan Furr on 3/26/20.
//  Copyright © 2020 Jordan Furr. All rights reserved.
//

#import "JEFPicture.h"

@implementation JEFPicture

-(instancetype)initWithImageString:(NSString *)imageString
{
    self = [super init];
    if (self)
    {
        _imageString = imageString;
    }
    return self;
}
@end

@implementation JEFPicture(JSONConvertable)

-(instancetype)initWithDict:(NSDictionary *)dict
{
    NSString *imageString = dict[@"image_url"];
    
    return [self initWithImageString:imageString];
}

@end
