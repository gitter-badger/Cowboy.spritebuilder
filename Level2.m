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
    
    timer =[NSTimer scheduledTimerWithTimeInterval:0.25 target:self selector:@selector(zaman) userInfo:nil repeats:YES];
    
    CGSize s = [CCDirector sharedDirector].viewSize;
   
    
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"CowboyGirl.plist"];
    
    cowboy =[CCSprite spriteWithImageNamed:@"CowboyGirl/Idle (1).png"];
    cowboy.scale*=0.6;
     [cowboy setPosition:ccp(s.width*0.2, s.height*0.5)];
    
    //-----------KOŞMA AYARLARI---------------------------
    runningDizi = [NSMutableArray array];
    for (int i=1; i<=8; i++) {
        [runningDizi addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"CowboyGirl/Run (%d).png",i]]];
    }
    
    
    running =[CCAnimation animationWithSpriteFrames:runningDizi delay:0.03f];
    runAnimation = [CCActionAnimate actionWithAnimation:running];
    //runAnimation = [CCActionRepeatForever actionWithAction:runAnimation];
    runAnimation.tag=1;
    NSLog(@"cowboy idle level1");
    
    
    //------------------NEFES ALMA AYARLARI------------------------
    idlingDizi = [NSMutableArray array];
    for (int i=1; i<=10; i++) {
        [idlingDizi addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"CowboyGirl/Idle (%d).png",i]]];
    }
    
    
    idling =[CCAnimation animationWithSpriteFrames:idlingDizi delay:0.025f];
    idleAnimation = [CCActionAnimate actionWithAnimation:idling];
    [idleAnimation setTag:2];
    //idleAnimation = [CCActionRepeatForever actionWithAction:idleAnimation];

    //------------------------------------------------
    
    
    
    
    //[self addChild:cowboy];
    
    [_physicsNode addChild:cowboy];
    cowboy.physicsBody = [CCPhysicsBody bodyWithCircleOfRadius:10.0f andCenter:CGPointMake(0, 0)];
    cowboy.physicsBody.type=CCPhysicsBodyTypeDynamic;
    cowboy.physicsBody.affectedByGravity=TRUE;
    
    [cowboy runAction:idleAnimation];
    //[cowboy.animationManager runAnimationsForSequenceNamed:@"dead"];
    
    
}

- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    
    
    CGPoint touchLocation = [touch locationInNode:self];
     CGSize s = [CCDirector sharedDirector].viewSize;
    
    if ((touchLocation.x<s.width) && (touchLocation.y<s.height) ){
        /*
        if (CGRectContainsPoint(_btnSag.boundingBox, touchLocation)) {
            NSLog(@"BTNSAG DOKANDI LAA");
            [cowboy stopAllActions];
            [cowboy runAction:runAnimation];
            
            if (cowboy.position.x>220) {
                CCActionMoveTo *YerDegistir = [CCActionMoveTo actionWithDuration:0.1 position:CGPointMake(_scrollView.position.x-10.0f, _scrollView.position.y)];
                [_scrollView runAction:YerDegistir];
            }
            else{
                
                CCActionMoveTo *YerDegistir = [CCActionMoveTo actionWithDuration:0.1 position:CGPointMake(cowboy.position.x+10.0f, cowboy.position.y)];
                [cowboy runAction:YerDegistir];
                
            }
        }
        //[self removeChild:cowboy];
        
        
        //[cowboy setPosition:ccp(cowboy.position.x+1.0f,cowboy.position.y)];
        //cowboy =[CCBReader load:@"running"];
        //cowboy.scale*=0.6;
        //[cowboy setPosition:ccp(s.width*0.5, s.height*0.5)];
        
        
        //[cowboy.animationManager runAnimationsForSequenceNamed:@"idle"];
        //[self addChild:cowboy];
        */
    }
    
    
    
}
- (void)touchEnded:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    CGPoint touchLocation = [touch locationInNode:self];
    
    CGSize s = [CCDirector sharedDirector].viewSize;
    
if ((touchLocation.x<s.width) && (touchLocation.y<s.height) ){
    
    //[self removeChild:cowboy];
    NSLog(@"DOKANMA Bittii");
    //cowboy =[CCBReader load:@"idle"];
    //cowboy.scale*=0.6;
    CGPoint impulse = ccp(0.0f, 50.0f);
    [cowboy.physicsBody applyImpulse:impulse];
    //[cowboy setPosition:ccp(s.width*0.5, s.height*0.5)];
    
    
    //[cowboy.animationManager runAnimationsForSequenceNamed:@"dead"];
    //[self addChild:cowboy];
    }
}

-(void)update:(CCTime)delta{
    if (_btnSag.highlighted)
    {
        NSLog(@"BTNSAG DOKANDI LAA");
        if([cowboy getActionByTag:2]==nil){
            
            if([cowboy getActionByTag:1]==nil){
                [cowboy runAction:runAnimation];
                
                
                
                
            }
            
            
            
            if (cowboy.position.x>220) {
                CCActionMoveTo *YerDegistir = [CCActionMoveTo actionWithDuration:0.05 position:CGPointMake(_scrollView.position.x-5.0f, _scrollView.position.y)];
                [_scrollView runAction:YerDegistir];
            }
            else{
                
                CCActionMoveTo *YerDegistir = [CCActionMoveTo actionWithDuration:0.05 position:CGPointMake(cowboy.position.x+5.0f, cowboy.position.y)];
                [cowboy runAction:YerDegistir];
                
            }
        }
        
        
        
    }
    
    else{
        
        
        
        if([cowboy getActionByTag:1] ==nil){
            if([cowboy getActionByTag:2]==nil)
                [cowboy runAction:idleAnimation];
            
        }
        //[cowboy stopAllActions];
        //[cowboy runAction:idleAnimation];
        
        
        
        //[cowboy runAction:idleAnimation];
        
        
        
    }
    
   
    
   


}

-(void)zaman{
    
    

}

@end
