//
//  Grid.m
//  GameOfLife
//
//  Created by Luke Solomon on 6/24/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Grid.h"
#import "Creature.h"

// these are variables that cannot be changed
static const int GRID_ROWS = 8;
static const int GRID_COLUMNS = 8;

@implementation Grid {
    NSMutableArray *_gridArray;
    float _cellWidth;
    float _cellHeight;
}//Grid Method

- (void)onEnter {
    [super onEnter];
    [self setupGrid];
    
    // accept touches on the grid
    self.userInteractionEnabled = YES;
    
}//onEnter Method

- (void)setupGrid {
    // divide the grid's size by the number of columns/rows to figure out the right width and height of each cell
    _cellWidth = self.contentSize.width / GRID_COLUMNS;
    _cellHeight = self.contentSize.height / GRID_ROWS;
    
    float x = 0;
    float y = 0;
    
    // initialize the array as a blank NSMutableArray
    _gridArray = [NSMutableArray array];
    
    // initialize Creatures
    for (int i = 0; i < GRID_ROWS; i++) {
        // this is how you create two dimensional arrays in Objective-C. You put arrays into arrays.
        _gridArray[i] = [NSMutableArray array];
        x=0;
        
        for (int j = 0; j < GRID_COLUMNS; j++) {
            Creature *creature = [[Creature alloc] initCreature];
            creature.anchorPoint = ccp(0,0);
            creature.position = ccp(x,y);
            [self addChild: creature];
            
            // this is shorthand to access an array inside an array
            _gridArray[i][j] = Creature;
            
            // make creatures visible to test this method, remove this once we know we have filled the grid properly
            creature.isAlive = YES;
            //*****DELETE THIS LATER
            
            x += _cellWidth;
        }//for int j
        y += _cellHeight;
    }//for int i

}//SetupGrid Method

@end