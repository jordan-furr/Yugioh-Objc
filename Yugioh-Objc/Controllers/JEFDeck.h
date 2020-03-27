//
//  JEFDeck.h
//  Yugioh-Objc
//
//  Created by Jordan Furr on 3/26/20.
//  Copyright © 2020 Jordan Furr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class JEFCard;
@class JEFPicture;

NS_ASSUME_NONNULL_BEGIN

@interface JEFDeck : NSObject

+(void)fetchCards:(NSString *) searchTerm completion:(void(^)(NSArray<JEFCard *> *))completion;
+(void)fetchImage:(JEFCard *)card completion:(void(^)(UIImage *))completion;

@end

NS_ASSUME_NONNULL_END
