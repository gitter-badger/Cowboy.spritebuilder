#import "MainScene.h"

@implementation MainScene

+ (MainScene *)scene
{
    return [[self alloc] init];
}

- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
    if (!self) return(nil);
    
    return self;
}


-(void)ArcadeMode:(id)sender{
    NSLog(@"yeniOyun Girdi");
    //CCScene *gameplayScene = [CCBReader loadAsScene:@"Level2"];
    [[CCDirector sharedDirector] replaceScene:[CCBReader loadAsScene:@"Level2"]];
    
}


@end
