//
//  GameScene.m
//  ForceExample
//
//  Created by Fernando Rocha on 8/12/15.
//  Copyright (c) 2015 Fernando Rocha. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    self.backgroundColor = [SKColor colorWithRed:0.29 green:0.75 blue:0.99 alpha:1];
    
    //creating the platform
    SKSpriteNode *platform = [SKSpriteNode spriteNodeWithColor:[SKColor brownColor] size:CGSizeMake(100, 20)];
    platform.position = CGPointMake(50, 100);
    
    //adding the platform to the scene
    [self addChild:platform];
    
    //creating first action
    SKAction *move = [SKAction moveByX:self.size.width-platform.size.width y:0 duration:2];
    
    //creating reversed action
    SKAction *moveBack = [move reversedAction];
    
    //creating the wait period
    SKAction *wait = [SKAction waitForDuration:1.5];
    
    //stacking up actions
    SKAction *backAndForth = [SKAction sequence:@[move, wait, moveBack, wait]];
    
    //creating the repeater
    SKAction *repeater = [SKAction repeatActionForever:backAndForth];
    
    //running the actions
    [platform runAction:repeater];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
