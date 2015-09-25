//
//  TQStarRatingView.h
//  TQStarRatingView
//
//
//


#import <UIKit/UIKit.h>
@class TQStarRatingView;

@protocol StarRatingViewDelegate <NSObject>

@optional
-(void)starRatingView:(TQStarRatingView *)view score:(float)score;

@end

@interface TQStarRatingView : UIView

@property (nonatomic, readonly) int numberOfStar;

@property (nonatomic, weak) id <StarRatingViewDelegate> delegate;
@property (nonatomic) NSInteger index;

/**
 
 *
 *  @param frame  Rectangles
 *  @param number
 *
 *  @return TQStarRatingViewObject
 */
- (id)initWithFrame:(CGRect)frame numberOfStar:(int)number;

/**
 
 *
 *  @param score
 *  @param isAnimate
 */
- (void)setScore:(float)score withAnimation:(bool)isAnimate;

/**
 
 *
 *  @param score
 *  @param isAnimate
 *  @param completion   block
 */
- (void)setScore:(float)score withAnimation:(bool)isAnimate completion:(void (^)(BOOL finished))completion;

@end

#define kBACKGROUND_STAR @"heartGray"
#define kFOREGROUND_STAR @"heartRed"

#define Colororange @"Heart_gray"
#define kNUMBER_OF_STAR  5