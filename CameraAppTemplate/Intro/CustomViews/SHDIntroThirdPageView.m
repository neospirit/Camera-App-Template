//
//  SHDIntroThirdPageView.m
//  CameraAppTemplate
//
//  Created by Sergey Grischyov on 07.03.16.
//  Copyright © 2016 ShadeApps. All rights reserved.
//

#import "SHDIntroThirdPageView.h"
@interface SHDIntroThirdPageView ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomBorderViewTopConstraint;

@end

@implementation SHDIntroThirdPageView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self == nil) return nil;
    [self initalizeSubviews];
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self == nil) return nil;
    [self initalizeSubviews];
    return self;
}

- (void)initalizeSubviews{
    if (self.subviews.count == 0){
        NSString *nibName = NSStringFromClass([self class]);
        [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
        self.bounds = self.container.bounds;
        [self addSubview:self.container];
        
        [self stretchToSuperView:self.container];
    }
}

- (void)stretchToSuperView:(UIView*) view {
    view.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *bindings = NSDictionaryOfVariableBindings(view);
    NSString *formatTemplate = @"%@:|[view]|";
    for (NSString * axis in @[@"H",@"V"]) {
        NSString * format = [NSString stringWithFormat:formatTemplate,axis];
        NSArray * constraints = [NSLayoutConstraint constraintsWithVisualFormat:format options:0 metrics:nil views:bindings];
        [view.superview addConstraints:constraints];
    }
//Customizing Placeholder Text color
    self.txtUsernameField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.txtUsernameField.placeholder attributes:@{ NSForegroundColorAttributeName:[CBTFunctions colorFromHex:@"DDDDDD"]}];;
    if ([CBTFunctions isRetina3_5or4Inch]){
        self.bottomBorderViewTopConstraint.constant = 10.0;
    }

}

@end