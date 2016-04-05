//
//  Level2.h
//  Cowboy
//
//  Created by Gokhan Sargin on 4.04.2016.
//  Copyright 2016 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Level2 : CCScene {
    CCSprite * cowboy;
    NSMutableArray * runningDizi;
    CCAnimation* running;
    
    NSMutableArray* idlingDizi;
    CCAnimation* idling;
    
    
    
    CCActionAnimate * runAnimation;
    CCActionAnimate * idleAnimation;
    
    
    
}

+(Level2 *)scene;
-(id)init;

@end
