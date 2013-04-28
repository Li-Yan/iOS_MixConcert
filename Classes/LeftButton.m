
#import "LeftButton.h"

@implementation LeftButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (BOOL) pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    /* Surprisingly, this method is called even when point has a negative
     * component and is obviously outside of self.bounds. */
    NSLog(@"point called\n");
    if (CGRectContainsPoint(self.bounds, point))
    {
        /* The point is within our bounds. */
        NSLog(@"bound origin: %f %f\n", self.bounds.origin.x, self.bounds.origin.y);
        NSLog(@"bound width height: %f %f\n", self.bounds.size.width,self.bounds.size.height);
        NSLog(@"point : %f %f \n", point.x, point.y);
        
        
    if ((point.x > (self.bounds.size.width /2)) && (point.y > (self.bounds.origin.y + (self.bounds.size.height / 2)) )){
        
        NSLog(@"here\n");
        return NO;
    }
    return YES;
    
    }
    else
    {
        return NO;
    }
}


@end
