//
//  HJDetailTopView.m
//  Passersbyjun
//
//  Created by 嘉瑞科技有限公司 on 2018/3/20.
//  Copyright © 2018年 嘉瑞科技有限公司. All rights reserved.
//

#import "HJDetailTopView.h"
#import "HJDetailTopCollectionViewCell.h"
@interface HJDetailTopView()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>

/*collectionView*/
@property(nonatomic,strong) UICollectionView *collectionView;
/*选中数组*/
@property(nonatomic,strong) NSMutableSet *selectedSet;

@end
@implementation HJDetailTopView
static NSString *const identifer = @"identifer";
-(NSMutableSet *)selectedSet
{
    if (!_selectedSet) {
        
        _selectedSet = [[NSMutableSet alloc] init];
    }
    return _selectedSet;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.collectionView];
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.offset(0);
            make.top.bottom.offset(0);
        }];
        
    }
    return self;
}
-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.sectionInset  = UIEdgeInsetsMake(0, 0, 0, 0);
        flowLayout.minimumLineSpacing = 0.0;
        flowLayout.minimumInteritemSpacing = 0.0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[HJDetailTopCollectionViewCell class] forCellWithReuseIdentifier:identifer];
    }
    return _collectionView;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.topArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    HJDetailTopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifer forIndexPath:indexPath];
    
    cell.btn.tag = indexPath.item;
    
    [cell.btn setTitle:self.topArr[indexPath.row] forState:UIControlStateNormal];
    
    [cell.btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    if ([self.selectedSet containsObject:[NSString stringWithFormat:@"%ld",indexPath.row]]) {
     
        cell.btn.enabled = NO;
        
        if (self.alphScroller <1.0) {
            
            [cell.btn setImage:nil forState:UIControlStateDisabled];
        }else
        {
            [cell.btn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateDisabled];
        }
        
        [cell.btn setTitleColor:HJRGBAColor(230, 84, 0, self.alphScroller) forState:UIControlStateDisabled];
        
        
    }else
    {
        cell.btn.enabled = YES;
        [cell.btn setTitleColor:[UIColor colorWithWhite:0.0 alpha:self.alphScroller] forState:UIControlStateNormal];
    }

    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(SCREEN_WIDTH/self.topArr.count, CGRectGetHeight(self.bounds));
}

-(void)setTopArr:(NSArray *)topArr
{
    _topArr = topArr;
    
    [self.collectionView reloadData];
}


-(void)setSelectedStr:(NSString *)selectedStr
{
    _selectedStr = selectedStr;
    
    [self.topArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        if ([obj isEqualToString:selectedStr]) {
            [self.selectedSet removeAllObjects];
            [self.selectedSet addObject:[NSString stringWithFormat:@"%ld",idx]];
            [self.collectionView reloadData];
        }
    }];
}

-(void)setAlphScroller:(CGFloat)alphScroller
{
    _alphScroller = alphScroller;
    
    self.backgroundColor = [UIColor colorWithWhite:1.0 alpha:alphScroller];
    
    self.collectionView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:alphScroller];

    [self.collectionView reloadData];
}
-(void)btnClick:(UIButton *)sender
{
    
    [self.selectedSet removeAllObjects];
    [self.selectedSet addObject:[NSString stringWithFormat:@"%ld",sender.tag]];
    
    [self.delegate gotoScroollerAndTitle:sender.titleLabel.text];
    
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 0, rect.size.height);
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
    CGContextSetLineWidth(context, 1.0f);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithWhite:0.8 alpha:0.4].CGColor);
    CGContextStrokePath(context);
}

@end
