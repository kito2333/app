//
//  RatingStar.m
//  LetsGoTes
//
//  Created by sherlock1017 on 2020/10/22.
//

#import "RatingStar.h"

@implementation RatingStar

//MARK: initialization
- (void)setRating:(int)rating{
    _rating = rating;
    [self updateButtons];
}
- (void)setStarSize:(CGSize)starSize{
    _starSize = starSize;
    [self setupButtons];
}

- (void)setStarCount:(int)starCount{
    _starCount = starCount;
    [self setupButtons];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _buttonList = [[NSMutableArray alloc] initWithCapacity:_starCount];
        [self setupButtons];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _buttonList = [[NSMutableArray alloc] initWithCapacity:_starCount];
        [self setupButtons];
    }
    return self;
}

//MARK: ACTION
- (void)setupButtons
{
    for (UIButton *button in _buttonList) {
        [self removeArrangedSubview: button];
        [button removeFromSuperview];
    }
    [_buttonList removeAllObjects];
    UIImage *emptyStar = [UIImage imageNamed:@"emptyStar.png"];
    UIImage *fillStar = [UIImage imageNamed:@"filledStar.png"];
    UIImage *highStar = [UIImage imageNamed:@"highlightedStar.png"];
    
    for (int i = 0; i < _starCount; i++) {
        UIButton *btn = [[UIButton alloc] init];
        
        [btn setImage:emptyStar forState:UIControlStateNormal];
        [btn setImage:fillStar forState:UIControlStateSelected];
        [btn setImage:highStar forState:UIControlStateHighlighted];
        [btn setImage:highStar forState:UIControlStateHighlighted|UIControlStateSelected];
        
        btn.translatesAutoresizingMaskIntoConstraints = false;
        [[btn.heightAnchor constraintEqualToConstant:_starSize.height] setActive:TRUE];
        [[btn.widthAnchor constraintEqualToConstant:_starSize.width] setActive: TRUE];
        
        NSString *str = [[NSString alloc] initWithFormat:@"Set %d star rating",(i+1)];
        [btn setAccessibilityLabel:str];
        
        [btn addTarget:self action:@selector(ratingButtons:) forControlEvents: UIControlEventTouchUpInside];
        [self addArrangedSubview: btn];
        [_buttonList addObject: btn];
    }
    
    [self updateButtons];
}

- (void)ratingButtons:(UIButton *)btn {
    NSLog(@"Button pressed 👍");
    NSUInteger index = [_buttonList indexOfObject:btn];
    if (index + 1 == _rating) {
        self.rating = 0;
    } else {
        self.rating = (int) index + 1;
    }
}

- (void)updateButtons {
    for (int i = 0; i < _buttonList.count; i++)  {
        UIButton *btn = [_buttonList objectAtIndex: i];
        [btn setSelected: (i < _rating)];
        NSString *hintStr;
        if (_rating == i + 1) {
            hintStr = @"Tap to reset the rating to zero";
        } else {
            hintStr = nil;
        }
        
        NSString *valueStr;
        switch (_rating) {
            case 0:
                valueStr = @"No rating set";
                break;
            case 1:
                valueStr = @"1 rating set";
                break;
            default:
                valueStr = [[NSString alloc] initWithFormat:@"%d rating set",_rating];
                break;
        }
        
        [btn setAccessibilityHint:hintStr];
        [btn setAccessibilityValue: valueStr];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
