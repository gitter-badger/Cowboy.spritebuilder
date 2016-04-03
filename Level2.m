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
    
    
    return self;
}

-(void)onEnter{
    
    [super onEnter];
    NSLog(@"giricek level2");
    
}

@end
