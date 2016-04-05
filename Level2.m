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
    
    
    CGSize s = [CCDirector sharedDirector].viewSize;
   
    
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"CowboyGirl.plist"];
    
    cowboy =[CCSprite spriteWithImageNamed:@"CowboyGirl/Idle (1).png"];
    
     [cowboy setPosition:ccp(s.width*0.5, s.height*0.5)];
    
    runningDizi = [NSMutableArray array];
    for (int i=1; i<=8; i++) {
        [runningDizi addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"CowboyGirl/Run (%d).png",i]]];
    }
    
    
    running =[CCAnimation animationWithSpriteFrames:runningDizi delay:0.075f];
    runAnimation = [CCActionAnimate actionWithAnimation:running];
    runAnimation = [CCActionRepeatForever actionWithAction:runAnimation];
    NSLog(@"cowboy idle level1");
    
    
    //------------------NEFES ALMA AYARLARI------------------------
    idlingDizi = [NSMutableArray array];
    for (int i=1; i<=10; i++) {
        [idlingDizi addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"CowboyGirl/Idle (%d).png",i]]];
    }
    
    
    idling =[CCAnimation animationWithSpriteFrames:idlingDizi delay:0.075f];
    idleAnimation = [CCActionAnimate actionWithAnimation:idling];
    idleAnimation = [CCActionRepeatForever actionWithAction:idleAnimation];

    //------------------------------------------------
    
    
    [cowboy runAction:idleAnimation];
    
    [self addChild:cowboy];
    //[cowboy.animationManager runAnimationsForSequenceNamed:@"dead"];
    
    
}

- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    
    
    CGPoint touchLocation = [touch locationInNode:self];
     CGSize s = [CCDirector sharedDirector].viewSize;
    if ((touchLocation.x<s.width) && (touchLocation.y<s.height) ){
        
        //[self removeChild:cowboy];
        
        NSLog(@"DOKANDI LAA");
        [cowboy stopAllActions];
        [cowboy runAction:runAnimation];
        //cowboy =[CCBReader load:@"running"];
        //cowboy.scale*=0.6;
        //[cowboy setPosition:ccp(s.width*0.5, s.height*0.5)];
        
        
        //[cowboy.animationManager runAnimationsForSequenceNamed:@"idle"];
        //[self addChild:cowboy];
        
    }
    
    
    
}
- (void)touchEnded:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    CGPoint touchLocation = [touch locationInNode:self];
    
    CGSize s = [CCDirector sharedDirector].viewSize;
    
if ((touchLocation.x<s.width) && (touchLocation.y<s.height) ){
    
    //[self removeChild:cowboy];
    NSLog(@"DOKANMA Bittii");
    [cowboy stopAllActions];
    [cowboy runAction:idleAnimation];
    //cowboy =[CCBReader load:@"idle"];
    //cowboy.scale*=0.6;
    //[cowboy setPosition:ccp(s.width*0.5, s.height*0.5)];
    
    
    //[cowboy.animationManager runAnimationsForSequenceNamed:@"dead"];
    //[self addChild:cowboy];
    }
}

-(void)update:(CCTime)delta{


}

@end
