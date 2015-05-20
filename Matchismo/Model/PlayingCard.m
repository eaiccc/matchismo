//
//  PlayingCard.m
//  Matchismo
//
//  Created by ChangLink on 2015/5/7.
//  Copyright (c) 2015年 Neurv. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit;

-(int)match:(NSArray *)otherCards{
    if (self.mode == PlayMode2CardMatchPerfect) {
        return [self matchPerfect:otherCards];
    }
    return [self matchRank:otherCards];
}
-(int)matchPerfect:(NSArray *)otherCards{
    int score = 0;
    if([otherCards count]==1){
        PlayingCard *otherCard = [otherCards firstObject];
        if(otherCard.rank == self.rank && [otherCard.suit isEqualToString:self.suit]){
            score = 4;
        }
    }
    return score;
}
-(int)matchRank:(NSArray *)otherCards{
    int score = 0;
    if([otherCards count]==1){
        PlayingCard *otherCard = [otherCards firstObject];
        if(otherCard.rank == self.rank){
            score = 4;
        } else if  ( [otherCard.suit isEqualToString:self.suit]){
            score = 1;
        }
    }
    return score;
}
-(NSString*)contents{
    NSArray* rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+(NSArray*)validSuits{
    return @[@"♠️",@"♣️",@"♥️",@"♦️"];
}
-(void)setSuit:(NSString *)suit{
    if( [[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}
-(NSString*)suit{
    return _suit ? _suit: @"?";
}
+(NSArray*)rankStrings{
    
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}
+(NSUInteger)maxRank{
    NSLog(@"count %ld", [[self rankStrings] count]);
    return [[self rankStrings] count]-1;
}

-(void)setRank:(NSUInteger)rank{
    if(rank<= [PlayingCard maxRank]){
        _rank = rank;
    }
}
-(id)copyWithZone:(NSZone *)zone
{
    // We'll ignore the zone for now
    PlayingCard *another = [[PlayingCard alloc] init];
    another.rank = self.rank;
    another.suit = self.suit;
    
    return another;
}
@end
