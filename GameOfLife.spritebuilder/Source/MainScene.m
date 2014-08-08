//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"
#import "Grid.h"

@implementation MainScene {
    Grid *_grid;
    CCTimer *_timer;
    CCLabelTTF *_generationLabel;
    CCLabelTTF *_populationLabel;
}//MainScene

-(id)init {
    self = [super init];
    
    if (self){
        _timer = [[CCTimer alloc] init];
    }
    
    return self;
}//init

-(void)play {
    
    //tells the game to call method "step" every half second
    [self schedule:@selector(step) interval:(0.5f)];
    
}//play

-(void) pause {
    
    [self unschedule:@selector(step)];
    
}//pause

-(void) step {
    
    [_grid evolveStep];
    _generationLabel.string = [NSString stringWithFormat:@"%d", _grid.generation];
    _populationLabel.string = [NSString stringWithFormat:@"%d", _grid.totalAlive];
    
}//step






@end
