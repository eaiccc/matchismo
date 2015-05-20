//
//  PlayingCard.h
//  Matchismo
//
//  Created by ChangLink on 2015/5/7.
//  Copyright (c) 2015年 Neurv. All rights reserved.
//

#import "Card.h"
#import "CardMatchingGame.h"
@interface PlayingCard : Card<NSCopying>
@property (strong, nonatomic) NSString* suit;
@property (nonatomic) NSUInteger rank;
+(NSArray*)validSuits;
+(NSUInteger)maxRank;
@property (atomic)PlayMode mode;
@end
