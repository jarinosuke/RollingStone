//
//  InputLayer.h
//  RollingStone
//
//  Created by jari on 12/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "cocos2d.h"

	// SneakyInput headers
#import "SneakyButton.h"
#import "SneakyButtonSkinnedBase.h"
#import "SneakyJoystick.h"
#import "SneakyJoystickSkinnedBase.h"

#import "SneakyExtensions.h"

@interface InputLayer : CCLayer 
{
	SneakyJoystick* joystick;
	
	ccTime totalTime;
	ccTime nextShotTime;
}

@end
