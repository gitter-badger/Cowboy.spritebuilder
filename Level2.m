//
//  Level2.m
//  Cowboy
//
//  Created by Gokhan Sargin on 4.04.2016.
//  Copyright 2016 Apportable. All rights reserved.
//

#import "Level2.h"


@implementation Level2

+ (Level2 *)scene
{
   
    NSLog(@"level2scene girdi");
    return [[self alloc] init];
    
    
}

- (id)init
{
    
    // Apple recommend assigning self with supers return value
    self = [super init];
    if (!self) return(nil);
    
    NSLog(@"initoldu level2");
    self.userInteractionEnabled = TRUE;
    
    
    return self;
}

-(void)onEnter{
    
    [super onEnter];
    NSLog(@"giricek level2");
    
    cowboy = [CCBReader load:@"idle"];
    NSLog(@"cowboy idle level1");
    
    cowboy.scale*=0.6;
    
    CGSize s = [CCDirector sharedDirector].viewSize;
    [cowboy setPosition:ccp(s.width*0.5, s.height*0.5)];
    
    NSLog(@"cowboy idle level1");
    
    [self addChild:cowboy];
    [cowboy.animationManager runAnimationsForSequenceNamed:@"idle"];
    
    
}

- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    
    
    CGPoint touchLocation = [touch locationInNode:self];
     CGSize s = [CCDirector sharedDirector].viewSize;
    if ((touchLocation.x<s.width) && (touchLocation.y<s.height) ){
        
        [self removeChild:cowboy];
        
        NSLog(@"DOKANDI LAA");
        cowboy =[CCBReader load:@"running"];
        cowboy.scale*=0.6;
        [cowboy setPosition:ccp(s.width*0.5, s.height*0.5)];
        [cowboy.animationManager runAnimationsForSequenceNamed:@"running"];
        [self addChild:cowboy];
        
    }
    
    
    
}
- (void)touchEnded:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    CGPoint touchLocation = [touch locationInNode:self];
    
    CGSize s = [CCDirector sharedDirector].viewSize;
    
if ((touchLocation.x<s.width) && (touchLocation.y<s.height) ){
    
    [self removeChild:cowboy];
    NSLog(@"DOKANMA Bittii");
    cowboy =[CCBReader load:@"idle"];
    cowboy.scale*=0.6;
    [cowboy setPosition:ccp(s.width*0.5, s.height*0.5)];
    [cowboy.animationManager runAnimationsForSequenceNamed:@"idle"];
    [self addChild:cowboy];
    }
}

-(void)update:(CCTime)delta{


}

@end
