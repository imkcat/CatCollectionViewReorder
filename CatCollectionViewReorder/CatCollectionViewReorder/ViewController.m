//
//  ViewController.m
//  CatCollectionViewReorder
//
//  Created by K-cat on 15/11/9.
//  Copyright © 2015年 K-cat. All rights reserved.
//

#import "ViewController.h"
#import "CatCollectionViewReorder.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout> {
    UICollectionView *_collectionView;
    CatCollectionViewReorder *_collectionViewReorder;
    NSMutableArray *_collectionDataSource;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBaseLayout];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  初始化基础布局
 */
- (void)initBaseLayout {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    _collectionDataSource = [[NSMutableArray alloc] init];
    for (int i=0; i<100; i++) {
        [_collectionDataSource addObject:[NSNumber numberWithInt:i]];
    }
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[TestCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([TestCollectionViewCell class])];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    _collectionViewReorder = [[CatCollectionViewReorder alloc] init];
    [_collectionViewReorder bindToCollectionView:_collectionView];
}

#pragma mark - UICollectionViewDelegate
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([TestCollectionViewCell class]) forIndexPath:indexPath];
    [cell.textLabel setText:[NSString stringWithFormat:@"%d",[[_collectionDataSource objectAtIndex:indexPath.row] intValue]]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 100);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _collectionDataSource.count;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
}

@end

@implementation TestCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        
        _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        [_textLabel setTextAlignment:NSTextAlignmentCenter];
        [_textLabel setTextColor:[UIColor blackColor]];
        [self addSubview:_textLabel];
    }
    return self;
}

@end
