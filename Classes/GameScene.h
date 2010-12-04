//
//  GameScene.h
//  RollingStone
//
//  Created by jari on 12/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "Stone.h"

typedef enum
{
	GameSceneLayerTagGame = 1,
	GameSceneLayerTagInput,
	
} GameSceneLayerTags;

typedef enum
{
	GameSceneNodeTagStone,
	
} GameSceneNodeTags;

@interface GameScene : CCLayer 
{
	
}

+(id) scene;
+(GameScene*) sharedGameScene;


-(Stone*) defaultStone;

@end
