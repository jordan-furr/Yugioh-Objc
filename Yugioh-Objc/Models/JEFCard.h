//
//  JEFCard.h
//  Yugioh-Objc
//
//  Created by Jordan Furr on 3/26/20.
//  Copyright © 2020 Jordan Furr. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JEFPicture;

NS_ASSUME_NONNULL_BEGIN

@interface JEFCard : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *type;
@property (nonatomic, copy, readonly) NSArray<NSDictionary *> *pictures;

-(instancetype)initWithName:(NSString *) name type:(NSString *) type pictures:(NSArray<NSDictionary *> *)  pictures;

@end

@interface  JEFCard (JSONConvertable)

-(instancetype)initWithDict:(NSDictionary *) dict;

@end

NS_ASSUME_NONNULL_END
