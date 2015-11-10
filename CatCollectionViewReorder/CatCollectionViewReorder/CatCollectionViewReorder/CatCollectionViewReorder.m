//
//  CatCollectionViewReorder.m
//  CatCollectionViewReorder
//
//  Created by K-cat on 15/11/9.
//  Copyright © 2015年 K-cat. All rights reserved.
//

#import "CatCollectionViewReorder.h"

typedef void(^GestureStateChangeBlocks)(UILongPressGestureRecognizer *gestureRecognizer);

@interface CatCollectionViewReorder () {
    UILongPressGestureRecognizer *_moveGesture;
    GestureStateChangeBlocks _moveGestureStateChangeBlocks;
}

@end

@implementation CatCollectionViewReorder

#pragma mark - Initialize method
- (instancetype)init {
    self = [super init];
    if (self) {
        _moveGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(moveGestureAction:)];
    }
    return self;
}

- (void)bindToCollectionView:(UICollectionView *)collectionView {
    [collectionView addGestureRecognizer:_moveGesture];
    _moveGestureStateChangeBlocks = ^(UILongPressGestureRecognizer *gestureRecognizer) {
        switch (gestureRecognizer.state) {
            case UIGestureRecognizerStateBegan:{
                [collectionView beginInteractiveMovementForItemAtIndexPath:[collectionView indexPathForItemAtPoint:[gestureRecognizer locationInView:collectionView]]];
                CGPoint tapLocation = [gestureRecognizer locationInView:[gestureRecognizer view]];
                [collectionView updateInteractiveMovementTargetPosition:CGPointMake(tapLocation.x+5, tapLocation.y+5)];
            }
                break;
            case UIGestureRecognizerStateChanged:{
                [collectionView updateInteractiveMovementTargetPosition:[gestureRecognizer locationInView:[gestureRecognizer view]]];
            }
                break;
            case UIGestureRecognizerStateEnded:{
                [collectionView endInteractiveMovement];
            }
                break;
            default:{
                [collectionView cancelInteractiveMovement];
            }
                break;
        }
    };
    
}

#pragma mark - MoveGesture Action
- (void)moveGestureAction:(id)sender {
    if (_moveGestureStateChangeBlocks) {
        _moveGestureStateChangeBlocks(sender);
    }
}

@end
