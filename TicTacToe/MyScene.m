//
//  MyScene.m
//  TicTacToe
//
//  Created by Frankie on 5/29/14.
//  Copyright (c) 2014 Francisco L. De Choudens Ortiz. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene{
    NSMutableArray *gridStatus;
    CGPoint locationToUIPosition;
    int player;
}

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        SKSpriteNode *bg = [SKSpriteNode spriteNodeWithImageNamed:@"bg"];
        bg.position = CGPointMake(self.size.width/2, self.size.height/2);
        
        [self addChild:bg];
        
        gridStatus = [[NSMutableArray alloc]init];
        for (int i = 0; i<9; i++) {
            [gridStatus addObject:@"1"];
        }
        
        player = 1;
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    
    
    for (UITouch *touch in touches) {
         CGPoint location = [touch locationInNode:self];
        
        if ([self checkIfValid:[touch locationInNode:self]]) {
            SKSpriteNode *sprite;
            if (player) {
                sprite = [SKSpriteNode spriteNodeWithImageNamed:@"turtle"];
                sprite.scale = 0.3;
                player = 0;
            }
            else{
                sprite = [SKSpriteNode spriteNodeWithImageNamed:@"rabit"];
                sprite.scale = 0.18;
                player = 1;
            }
            
            sprite.position = locationToUIPosition;
            
            //SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
            
            //[sprite runAction:[SKAction repeatActionForever:action]];
            
            [self addChild:sprite];
        }
       
        
        
    }
}

-(BOOL)checkIfValid:(CGPoint) location{
    
    //location.y>320 && location.y<460 first row
    //location.y>170 && location.y<300 second row
    //location.y>0 && location.y<150 Third row
    
    //location.x>0 && location.x<100 first column
    //location.x>110 && location.x<210 second column
    //location.x>220 && location.x<320 third column
    
    if (location.x>0 && location.x<100 && location.y>320) {
        if ([gridStatus[0] boolValue]) {
        locationToUIPosition = CGPointMake(0+100/2, (320+460)/2);
         gridStatus[0] = @"0";
            return TRUE;
        }
    }
    else if (location.x>110 && location.x<210 && location.y>320) {
        if ([gridStatus[1] boolValue]) {
            locationToUIPosition = CGPointMake((110+210)/2, (320+460)/2);
            gridStatus[1] = @"0";
            return TRUE;
        }
    }
    else if (location.x>220 && location.x<320 && location.y>320) {
        if ([gridStatus[2] boolValue]) {
            locationToUIPosition = CGPointMake((220+320)/2, (320+460)/2);
            gridStatus[2] = @"0";
            return TRUE;
        }
    }
    else if (location.x>0 && location.x<100 && location.y>170 && location.y<300) {
        if ([gridStatus[3] boolValue]) {
            locationToUIPosition = CGPointMake((100+0)/2, (170+300)/2);
            gridStatus[3] = @"0";
            return TRUE;
        }
    }
    else if (location.x>110 && location.x<210 && location.y>170 && location.y<300) {
        if ([gridStatus[4] boolValue]) {
            locationToUIPosition = CGPointMake((110+210)/2, (170+300)/2);
            gridStatus[4] = @"0";
            return TRUE;
        }
    }
    else if (location.x>220 && location.x<320 && location.y>170 && location.y<300) {
        if ([gridStatus[5] boolValue]) {
            locationToUIPosition = CGPointMake((220+320)/2, (170+300)/2);
            gridStatus[5] = @"0";
            return TRUE;
        }
    }
    else if (location.x>0 && location.x<100 && location.y>0 && location.y<150) {
        if ([gridStatus[6] boolValue]) {
            locationToUIPosition = CGPointMake((0+100)/2, (0+150)/2);
            gridStatus[6] = @"0";
            return TRUE;
        }
    }
    else if (location.x>110 && location.x<210  && location.y>0 && location.y<150) {
        if ([gridStatus[7] boolValue]) {
            locationToUIPosition = CGPointMake((110+210)/2, (0+150)/2);
            gridStatus[7] = @"0";
            return TRUE;
        }
    }
    else if (location.x>220 && location.x<320  && location.y>0 && location.y<150) {
        if ([gridStatus[8] boolValue]) {
            locationToUIPosition = CGPointMake((220+320)/2, (0+150)/2);
            gridStatus[8] = @"0";
            return TRUE;
        }
    }

    return false;
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
