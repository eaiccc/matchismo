//
//  Card.h
//  Matchismo
//
//  Created by ChangLink on 2015/5/7.
//  Copyright (c) 2015年 Neurv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property(strong, nonatomic) NSString *contents;
@property(nonatomic, getter=isChosen) BOOL chosen;
@property(nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;
@end
