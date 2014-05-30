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
    NSMutableArray *playersTokens;
    NSString *positionName,*name1,*name2,*name3;
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
        playersTokens = [NSMutableArray new];
        NSMutableArray *emptyToken = [NSMutableArray new];
        
        for (int i = 0; i<9; i++) {
            [gridStatus addObject:@"1"];
            [emptyToken addObject:@0];
        }
        [playersTokens addObject:emptyToken];
        [playersTokens addObject:emptyToken];
        
        player = 1; //initial player - turtle
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
                sprite.position = locationToUIPosition;
                sprite.name = positionName;
                [self addChild:sprite];
                if ([self checkWithCondition]) {
                    self.userInteractionEnabled = NO;
                    [self enumerateChildNodesWithName:name1 usingBlock:^(SKNode *node, BOOL *stop) {
                        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
                        [node runAction:[SKAction repeatActionForever:action]];
                        
                    }];
                    [self enumerateChildNodesWithName:name2 usingBlock:^(SKNode *node, BOOL *stop) {
                        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
                        [node runAction:[SKAction repeatActionForever:action]];
                        
                    }];
                    [self enumerateChildNodesWithName:name3 usingBlock:^(SKNode *node, BOOL *stop) {
                        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
                        [node runAction:[SKAction repeatActionForever:action]];
                        
                    }];
                }
                player = 0;
            }
            else{
                sprite = [SKSpriteNode spriteNodeWithImageNamed:@"rabbit"];
                sprite.scale = 0.18;
                sprite.position = locationToUIPosition;
                sprite.name = positionName;
                [self addChild:sprite];
                if ([self checkWithCondition]) {
                    self.userInteractionEnabled = NO;
                    [self enumerateChildNodesWithName:name1 usingBlock:^(SKNode *node, BOOL *stop) {
                        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
                        [node runAction:[SKAction repeatActionForever:action]];
                        
                    }];
                    [self enumerateChildNodesWithName:name2 usingBlock:^(SKNode *node, BOOL *stop) {
                        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
                        [node runAction:[SKAction repeatActionForever:action]];
                        
                    }];
                    [self enumerateChildNodesWithName:name3 usingBlock:^(SKNode *node, BOOL *stop) {
                        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
                        [node runAction:[SKAction repeatActionForever:action]];
                        
                    }];
                }
                player = 1;
            }
            
        }
    }
}

-(BOOL)checkWithCondition{
   
     NSMutableArray *temp =  [[NSMutableArray alloc]initWithArray:playersTokens[player]];
    
     //check#1 - horizontal
    if ([temp[0]intValue]+[temp[1]intValue]+[temp[2]intValue] == 15) {
        NSLog(@"win player %d",player);
        name1 = @"0";
        name2 = @"1";
        name3 = @"2";
        return true;
    }
    else if ([temp[3]intValue]+[temp[4]intValue]+[temp[5]intValue] == 15) {
        NSLog(@"win player %d",player);
        name1 = @"3";
        name2 = @"4";
        name3 = @"5";
          return true;
    }
    else if ([temp[6]intValue]+[temp[7]intValue]+[temp[8]intValue] == 15) {
        NSLog(@"win player %d",player);
        name1 = @"6";
        name2 = @"7";
        name3 = @"8";
          return true;
    }
    
    //check#2 - vertical
    else if ([temp[0]intValue]+[temp[3]intValue]+[temp[6]intValue] == 15) {
         NSLog(@"win player %d",player);
        name1 = @"0";
        name2 = @"3";
        name3 = @"6";
          return true;
    }
    else if ([temp[1]intValue]+[temp[4]intValue]+[temp[7]intValue] == 15) {
         NSLog(@"win player %d",player);
        name1 = @"1";
        name2 = @"4";
        name3 = @"7";
          return true;
    }
    else if ([temp[2]intValue]+[temp[5]intValue]+[temp[8]intValue] == 15) {
         NSLog(@"win player %d",player);
        name1 = @"2";
        name2 = @"5";
        name3 = @"8";
          return true;
    }
    
    //check#3 - diagonal
    else if ([temp[0]intValue]+[temp[4]intValue]+[temp[8]intValue] == 15) {
        NSLog(@"win player %d",player);
        
        name1 = @"0";
        name2 = @"4";
        name3 = @"8";
          return true;
    }
    else if ([temp[2]intValue]+[temp[4]intValue]+[temp[6]intValue] == 15) {
        NSLog(@"win player %d",player);
        name1 = @"2";
        name2 = @"4";
        name3 = @"6";
          return true;
    }
    return false;
}

-(BOOL)checkIfValid:(CGPoint) location{
    
    //location.y>320 && location.y<460 first row
    //location.y>170 && location.y<300 second row
    //location.y>0 && location.y<150 Third row
    
    //location.x>0 && location.x<100 first column
    //location.x>110 && location.x<210 second column
    //location.x>220 && location.x<320 third column
    NSMutableArray *temp =  [[NSMutableArray alloc]initWithArray:playersTokens[player]];
    if (location.x>0 && location.x<100 && location.y>320) {
        if ([gridStatus[0] boolValue]) {
        locationToUIPosition = CGPointMake(0+100/2, (320+460)/2);
         gridStatus[0] = @"0";
         positionName  = @"0";
         [temp replaceObjectAtIndex:0 withObject:@4];
         playersTokens[player] = temp;
            return TRUE;
        }
    }
    else if (location.x>110 && location.x<210 && location.y>320) {
        if ([gridStatus[1] boolValue]) {
            locationToUIPosition = CGPointMake((110+210)/2, (320+460)/2);
            gridStatus[1] = @"0";
            positionName  = @"1";
            [temp replaceObjectAtIndex:1 withObject:@9];
            playersTokens[player] = temp;
            return TRUE;
        }
    }
    else if (location.x>220 && location.x<320 && location.y>320) {
        if ([gridStatus[2] boolValue]) {
            locationToUIPosition = CGPointMake((220+320)/2, (320+460)/2);
            gridStatus[2] = @"0";
            positionName  = @"2";
            [temp replaceObjectAtIndex:2 withObject:@2];
            playersTokens[player] = temp;
            return TRUE;
        }
    }
    else if (location.x>0 && location.x<100 && location.y>170 && location.y<300) {
        if ([gridStatus[3] boolValue]) {
            locationToUIPosition = CGPointMake((100+0)/2, (170+300)/2);
            gridStatus[3] = @"0";
            positionName  = @"3";
            [temp replaceObjectAtIndex:3 withObject:@3];
            playersTokens[player] = temp;
            return TRUE;
        }
    }
    else if (location.x>110 && location.x<210 && location.y>170 && location.y<300) {
        if ([gridStatus[4] boolValue]) {
            locationToUIPosition = CGPointMake((110+210)/2, (170+300)/2);
            gridStatus[4] = @"0";
            positionName  = @"4";
            [temp replaceObjectAtIndex:4 withObject:@5];
            playersTokens[player] = temp;
            return TRUE;
        }
    }
    else if (location.x>220 && location.x<320 && location.y>170 && location.y<300) {
        if ([gridStatus[5] boolValue]) {
            locationToUIPosition = CGPointMake((220+320)/2, (170+300)/2);
            gridStatus[5] = @"0";
            positionName  = @"5";
            [temp replaceObjectAtIndex:5 withObject:@7];
            playersTokens[player] = temp;
            return TRUE;
        }
    }
    else if (location.x>0 && location.x<100 && location.y>0 && location.y<150) {
        if ([gridStatus[6] boolValue]) {
            locationToUIPosition = CGPointMake((0+100)/2, (0+150)/2);
            gridStatus[6] = @"0";
            positionName  = @"6";
            [temp replaceObjectAtIndex:6 withObject:@8];
            playersTokens[player] = temp;
            return TRUE;
        }
    }
    else if (location.x>110 && location.x<210  && location.y>0 && location.y<150) {
        if ([gridStatus[7] boolValue]) {
            locationToUIPosition = CGPointMake((110+210)/2, (0+150)/2);
            gridStatus[7] = @"0";
            positionName  = @"7";
            [temp replaceObjectAtIndex:7 withObject:@1];
            playersTokens[player] = temp;
            return TRUE;
        }
    }
    else if (location.x>220 && location.x<320  && location.y>0 && location.y<150) {
        if ([gridStatus[8] boolValue]) {
            locationToUIPosition = CGPointMake((220+320)/2, (0+150)/2);
            gridStatus[8] = @"0";
            positionName  = @"8";
            [temp replaceObjectAtIndex:8 withObject:@6];
            playersTokens[player] = temp;
            return TRUE;
        }
    }

    return false;
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
