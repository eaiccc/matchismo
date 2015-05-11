//
//  Deck.h
//  Matchismo
//
//  Created by ChangLink on 2015/5/7.
//  Copyright (c) 2015年 Neurv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Deck : NSObject
-(void) addCard:(Card*)card atTop:(BOOL)atTop;
-(void) addCard:(Card*)card;
-(Card *)drawRandomCard;
@end
