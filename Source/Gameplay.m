//
//  Gameplay.m
//  PeevedPenguins
//
//  Created by Benjamin Encz on 16/01/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Gameplay.h"

@implementation Gameplay {
    CCNode *_levelNode;
    CCNode *_catapultArm;
    CCPhysicsNode *_physicsNode;
}

- (void)didLoadFromCCB {
    [_levelNode addChild:[CCBReader load:@"Levels/Level1"]];
}

- (void)launchPenguin {
    CCNode* penguin = [CCBReader load:@"Penguin"];
    penguin.position = ccpAdd(_catapultArm.position, ccp(40, 115));
    
    [_physicsNode addChild:penguin];
    
    CGPoint launchDirection = ccp(1, 0);
    CGPoint force = ccpMult(launchDirection, 8000);
    
    [penguin.physicsBody applyForce:force];
    
    float screenWidth = [[CCDirector sharedDirector] viewSize].width;
    CCAction* scrollScreen = [CCActionMoveTo actionWithDuration:2.f position:ccp(screenWidth-self.contentSize.width, self.position.y)];
    [self runAction:scrollScreen];
}

@end
