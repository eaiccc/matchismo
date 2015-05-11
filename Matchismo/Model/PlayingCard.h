//
//  PlayingCard.h
//  Matchismo
//
//  Created by ChangLink on 2015/5/7.
//  Copyright (c) 2015年 Neurv. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property (strong, nonatomic) NSString* suit;
@property (nonatomic) NSUInteger rank;
+(NSArray*)validSuits;
+(NSUInteger)maxRank;

@end
