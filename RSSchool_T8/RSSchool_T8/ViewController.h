//
//  ViewController.h
//  RSSchool_T8
//
//  Created by Taisia Kataieva on 16.7.21..
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, strong) UIButton *paletteButton, *timerButton, *drawButton, *shareButton, *drawingsButton, *redButton, *darkBlueButton, *greenButton, *greyButton, *violetButton, *peachButton, *orangeButton, *blueButton, *pinkButton, *darkGreyButton, *darkGreenButton, *brownButton;
@property(nonatomic, strong) UIView *colorView;
@property(nonatomic, strong) UIColor *color;
@property(nonatomic, assign) NSNumber *color1;
@property(nonatomic, assign) NSInteger *color2;
@property(nonatomic, assign) NSInteger *color3;
@end

