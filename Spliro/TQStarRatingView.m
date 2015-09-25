//
//  TQStarRatingView.m
//  TQStarRatingView
//
// 
//
//

#import "TQStarRatingView.h"

@interface TQStarRatingView ()

@property (nonatomic, strong) UIView *starBackgroundView;
@property (nonatomic, strong) UIView *starForegroundView;
@property (nonatomic,strong) UIView *starmiddcolorview;

@end

@implementation TQStarRatingView

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame numberOfStar:kNUMBER_OF_STAR];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    _numberOfStar = kNUMBER_OF_STAR;
    [self commonInit];

}

/**
 * TQStarRatingView
 *
 *  @param frame  Rectangles
 *  @param number
 *
 *  @return TQStarRatingViewObject
 */
- (id)initWithFrame:(CGRect)frame numberOfStar:(int)number
{
    self = [super initWithFrame:frame];
    if (self) {
        _numberOfStar = number;
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    self.starBackgroundView = [self buidlStarViewWithImageName:kBACKGROUND_STAR];
    self.starForegroundView = [self buidlStarViewWithImageName:kFOREGROUND_STAR];
    self.starForegroundView.frame = CGRectMake(0,0,0,0);
    self.starBackgroundView.frame = CGRectMake(0,0,0,0);
  self.starmiddcolorview=[self buidlStarViewWithImageName:Colororange ];
    [self addSubview:self.starBackgroundView];
    [self addSubview:self.starmiddcolorview];
    [self addSubview:self.starForegroundView];
}

#pragma mark -
#pragma mark - Set Score

/**

 *
 *  @param score
 *  @param isAnimate
 */
- (void)setScore:(float)score withAnimation:(bool)isAnimate
{
    [self setScore:score withAnimation:isAnimate completion:^(BOOL finished){}];
}

/**
 *
 *
 *  @param score
 *  @param isAnimate
 *  @param completion
 */
- (void)setScore:(float)score withAnimation:(bool)isAnimate completion:(void (^)(BOOL finished))completion
{
    NSAssert((score >= 0.0)&&(score <= 1.0), @"score must be between 0 and 1");
    
    if (score < 0)
    {
        score = 0;
    }
    
    if (score > 1)
    {
        score = 1;
    }
    
    CGPoint point = CGPointMake(score * self.frame.size.width, 0);
    
    if(isAnimate)
    {
        __weak __typeof(self)weakSelf = self;
        
        [UIView animateWithDuration:0.2 animations:^
         {
             [weakSelf changeStarForegroundViewWithPoint:point];
             
         } completion:^(BOOL finished)
         {
             if (completion)
             {
                 completion(finished);
             }
         }];
    }
    else
    {
        [self changeStarForegroundViewWithPoint:point];
    }
}

#pragma mark -
#pragma mark - Touche Event
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    if(CGRectContainsPoint(rect,point))
    {
        [self changeStarForegroundViewWithPoint:point];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    __weak __typeof(self)weakSelf = self;
    
    [UIView animateWithDuration:0.2 animations:^
     {
         [weakSelf changeStarForegroundViewWithPoint:point];
         
     }];
}

#pragma mark -
#pragma mark - Buidl Star View

/**

 *
 *  @param imageName
 *
 *  @return
 */
- (UIView *)buidlStarViewWithImageName:(NSString *)imageName
{
    CGRect frame = self.bounds;
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.clipsToBounds = YES;
    for (int i = 0; i < self.numberOfStar; i ++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
                    
        imageView.frame = CGRectMake(i * frame.size.width / self.numberOfStar, 0, frame.size.width / self.numberOfStar, frame.size.height);
        [view addSubview:imageView];
        
    }
    return view;
}

#pragma mark -
#pragma mark - Change Star Foreground With Point

/**
 
 *
 *  @param point */
- (void)changeStarForegroundViewWithPoint:(CGPoint)point
{
    CGPoint p = point;
    
    if (p.x < 0)
    {
        p.x = 0;
    }
    
    if (p.x > self.frame.size.width)
    {
        p.x = self.frame.size.width;
    }
    
    NSString * str = [NSString stringWithFormat:@"%0.2f",p.x / self.frame.size.width];
    float score = [str floatValue];
    p.x = score * self.frame.size.width;
    
    self.starForegroundView.frame = CGRectMake(0, 0, (p.x)+2, self.frame.size.height);
//    
//    if(p.x<=17 && p.x>=4){
//        self.starmiddcolorview.frame= CGRectMake(0, 0, 17, self.frame.size.height);
//    }
//    else if(p.x>=21 && p.x<=34){
//        self.starmiddcolorview.frame= CGRectMake(0, 0, 34, self.frame.size.height);
//    }
//    else if(p.x>=37 && p.x<=51){
//        self.starmiddcolorview.frame= CGRectMake(0, 0, 51, self.frame.size.height);
//    }
//    else if(p.x>=54 && p.x<=68){
//        self.starmiddcolorview.frame= CGRectMake(0, 0, 68, self.frame.size.height);
//    }
//    else if(p.x>=71 && p.x<=83){
//        self.starmiddcolorview.frame= CGRectMake(0, 0, 83, self.frame.size.height);
//    }
//    else{
//        self.starmiddcolorview.frame= CGRectMake(0, 0, 0, self.frame.size.height);
//    }
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(starRatingView: score:)])
    {
        [self.delegate starRatingView:self score:score];
    }
}


@end
