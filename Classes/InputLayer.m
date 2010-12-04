//
//  InputLayer.m
//  RollingStone
//
//  Created by jari on 12/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "InputLayer.h"
#import "GameScene.h"

@interface InputLayer (PrivateMethods)
-(void) addFireButton;
-(void) addJoystick;
@end


@implementation InputLayer

-(id) init
{
	if ((self = [super init]))
	{
	
		[self addJoystick];
		
		[self scheduleUpdate];
	}
	
	return self;
}

-(void) dealloc
{
	[super dealloc];
}
 
-(void) addJoystick
{
	float stickRadius = 40;
	
	joystick = [SneakyJoystick joystickWithRect:CGRectMake(0, 0, stickRadius, stickRadius)];
	joystick.autoCenter = YES;
	joystick.hasDeadzone = YES;
	joystick.deadRadius = 10;
	
	CGSize screenSize = [[CCDirector sharedDirector] winSize];
	
	SneakyJoystickSkinnedBase* skinStick = [SneakyJoystickSkinnedBase skinnedJoystick];
	skinStick.position = CGPointMake(screenSize.width / 2, stickRadius );
	skinStick.backgroundSprite = [CCSprite spriteWithSpriteFrameName:@"joystick-sheet.png"];
		//be able to change color
		//skinStick.backgroundSprite.color = ccYELLOW;
	skinStick.thumbSprite = [CCSprite spriteWithSpriteFrameName:@"joystick-stick.png"];
	skinStick.thumbSprite.scale = 1.5f;
	skinStick.joystick = joystick;
	[self addChild:skinStick];
}

-(void) update:(ccTime)delta
{
	// Moving the stone with the thumbstick.
	GameScene* game = [GameScene sharedGameScene];
	Stone* stone = [game defaultStone];
	
	CGPoint velocity = ccpMult(joystick.velocity, 150);
	if (velocity.x != 0 && velocity.y != 0)
	{
		stone.position = CGPointMake(stone.position.x + velocity.x * delta, stone.position.y + velocity.y * delta);
	}
}

@end
