//
//  JEFCard.m
//  Yugioh-Objc
//
//  Created by Jordan Furr on 3/26/20.
//  Copyright © 2020 Jordan Furr. All rights reserved.
//

#import "JEFCard.h"

@implementation JEFCard

-(instancetype)initWithName:(NSString *)name type:(NSString *)type pictures:(NSArray<NSDictionary *> *)pictures
{
    self = [super init];
    if (self)
    {
        _name = name;
        _type = type;
        _pictures = pictures;
    }
    return self;
}

@end

@implementation JEFCard(JSONConvertable)

-(instancetype)initWithDict:(NSDictionary *)dict
{
    NSString *name = dict[@"name"];
    NSString *type = dict[@"type"];
    NSDictionary *pictures = dict[@"card_images"];
    
    return [self initWithName:name type:type pictures:pictures];
}

@end
