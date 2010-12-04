//
//  GameScene.m
//  RollingStone
//
//  Created by jari on 12/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import "GameScene.h"
#import "Stone.h"
#import "InputLayer.h"


@interface GameScene (PrivateMethods)

@end

@implementation GameScene

static GameScene* instanceOfGameScene;
+(GameScene*) sharedGameScene
{
	NSAssert(instanceOfGameScene != nil, @"GameScene instance not yet initialized!");
	return instanceOfGameScene;
}

+(id) scene
{
	CCScene* scene = [CCScene node];
	GameScene* layer = [GameScene node];
	[scene addChild:layer z:0 tag:GameSceneLayerTagGame];
	InputLayer* inputLayer = [InputLayer node];
	[scene addChild:inputLayer z:1 tag:GameSceneLayerTagInput];
	return scene;
}

-(id) init
{
	if ((self = [super init]))
	{
		instanceOfGameScene = self;
		
			// Load all of the game's artwork up front.
		CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
		[frameCache addSpriteFramesWithFile:@"RollingStone.plist"];
		
		CGSize screenSize = [[CCDirector sharedDirector] winSize];
		
		Stone* stone = [Stone stone];
		stone.position = CGPointMake(screenSize.width / 2, screenSize.height / 2);
		[self addChild:stone z:0 tag:GameSceneNodeTagStone];
		
	}
	return self;
}

-(void) dealloc
{
	instanceOfGameScene = nil;
	
		// don't forget to call "super dealloc"
	[super dealloc];
}


-(Stone*) defaultStone
{
	CCNode* node = [self getChildByTag:GameSceneNodeTagStone];
	NSAssert([node isKindOfClass:[Stone class]], @"node is not a Stone!");
	return (Stone*)node;
}

@end
