//
//  JEFDeck.m
//  Yugioh-Objc
//
//  Created by Jordan Furr on 3/26/20.
//  Copyright © 2020 Jordan Furr. All rights reserved.
//

#import "JEFDeck.h"
#import "JEFCard.h"
#import "JEFPicture.h"
#import <UIKit/UIKit.h>

static NSString * const baseURLString = @"https://db.ygoprodeck.com/api/v6/cardinfo.php";
static NSString * const searchQuery = @"fname";

@implementation JEFDeck

+(void)fetchCards:(NSString *)searchTerm completion:(void(^)(NSArray<JEFCard *>*))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *queryItem = [[NSURLQueryItem alloc] initWithName:searchQuery value:searchTerm];
    components.queryItems =@[queryItem];
    NSURL *finalURL = components.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        if(error) {
            NSLog(@"Error fetching pokemon from searchterm: %@", error);
            completion(nil);
            return;
        }
        
        if (!data){
            NSLog(@"Error fethcing pokemon data from search term: %@", error);
            completion(nil);
            return;
        }
        
        NSArray<NSDictionary *> *dataDict = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
        NSMutableArray *arrayofCards = [NSMutableArray new];
        
        for (NSDictionary *current in dataDict)
        {
            JEFCard *card = [[JEFCard alloc] initWithDict:current];
            [arrayofCards addObject:card];
        }
        completion(arrayofCards);
        //ompletion(arrayOfCountries);
        //check !json[NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
    }]resume];
}

+(void)fetchImage:(JEFCard *)card completion:(void (^)(UIImage * ))completion
{
    
    //NSString *imageString = card.pictures
    NSArray<NSDictionary *> *dictArray = card.pictures;
    NSDictionary *datadict = dictArray.firstObject;
    JEFPicture *picture = [[JEFPicture alloc] initWithDict:datadict];
     NSURL *imageURL = [[NSURL alloc] initWithString: picture.imageString];
    
    
    NSLog(@"%@", imageURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError *  _Nullable error) {
        if(error) {
            NSLog(@"Error fetching pokemon from searchterm: %@", error);
            completion(nil);
            return;
        }
        
        if (!data){
            NSLog(@"Error fethcing pokemon data from search term: %@", error);
            completion(nil);
            return;
        }
        
        UIImage *image = [UIImage imageWithData:data];
        completion(image);
    }]resume];
}

@end
