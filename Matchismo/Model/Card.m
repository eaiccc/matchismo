//
//  Card.m
//  Matchismo
//
//  Created by ChangLink on 2015/5/7.
//  Copyright (c) 2015年 Neurv. All rights reserved.
//

#import "Card.h"
@interface Card ()
@end

@implementation Card

- (int)match:(NSArray *)otherCards {
  int score = 0;
  for (Card *card in otherCards) {
    if ([card.contents isEqualToString:self.contents]) {
      score = 1;
    }
  }
  return score;
}

@end
