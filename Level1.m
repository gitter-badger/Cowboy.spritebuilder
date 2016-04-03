//
//  Level1.m
//  Cowboy
//
//  Created by Gokhan Sargin on 4.04.2016.
//  Copyright 2016 Apportable. All rights reserved.
//

#import "Level1.h"


@implementation Level1




-(void)onEnter{
    
    
    [super onEnter];
    
    cowboy = [CCBReader load:@"shoot"];
    NSLog(@"cowboy idle level1");
    
    CGSize s = [CCDirector sharedDirector].viewSize;
    [cowboy setPosition:ccp(s.width/4, s.height/2)];
    
    NSLog(@"cowboy idle level1");
    
    [self addChild:cowboy];
    [cowboy.animationManager runAnimationsForSequenceNamed:@"shoot"];
    
}


@end
