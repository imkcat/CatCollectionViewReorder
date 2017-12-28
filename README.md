# CatCollectionViewReorder

# Introduction
CatCollectionViewReorder is wirtten with iOS 9 new methods,it is easy to make your UICollectionView reorderable

# ScreenRecords
![ScreenShots1](https://raw.githubusercontent.com/K-cat/CatCollectionViewReorder/master/ScreenShot.gif)

# Usage

```objective-c
#import "CatCollectionViewReorder.h"

CatCollectionViewReorder *collectionViewReorder = [[CatCollectionViewReorder alloc] init];
[collectionViewReorder bindToCollectionView:_collectionView];

//Make sure rewirte this delegate method
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

```

