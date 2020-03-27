//
//  JEFPicture.h
//  Yugioh-Objc
//
//  Created by Jordan Furr on 3/26/20.
//  Copyright © 2020 Jordan Furr. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JEFPicture : NSObject

@property (nonatomic, copy, readonly) NSString *imageString;

-(instancetype)initWithImageString:(NSString *)imageString;

@end

@interface JEFPicture (JSONConvertable)

-(instancetype)initWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
