//
//  ViewController.m
//  RSSchool_T8
//
//  Created by Taisia Kataieva on 16.7.21..
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize path;
@synthesize paletteButton, timerButton, drawButton, shareButton, drawingsButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.drawingsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.drawingsButton.frame = CGRectMake(250.0f, 30.0f, 97, 42);
    self.drawingsButton.layer.borderWidth = 0;
    [self.drawingsButton setTitle:@"Drawings"
                         forState:UIControlStateNormal];
    
    [self.view addSubview:self.drawingsButton];
    
    self.paletteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.paletteButton.frame = CGRectMake(20.0f, 452.0f, 163.0f, 32.0f);
    self.paletteButton.layer.borderWidth = 1;
    [self.paletteButton setTitle:@"Open Palette"
                         forState:UIControlStateNormal];
    self.paletteButton.layer.cornerRadius = 10;
    self.paletteButton.layer.borderColor = [UIColor colorWithRed:33.0 / 255.0 green:176.0 / 255.0 blue:142.0 / 255.0 alpha:1.0].CGColor;
    [self.view addSubview:self.paletteButton];
    
    self.timerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.timerButton.frame = CGRectMake(20.0f, 504.0f, 151.0f, 32.0f);
    self.timerButton.layer.borderWidth = 1;
    [self.timerButton setTitle:@"Open Timer"
                         forState:UIControlStateNormal];
    self.timerButton.layer.cornerRadius = 10;
    self.timerButton.layer.borderColor = [UIColor colorWithRed:33.0 / 255.0 green:176.0 / 255.0 blue:142.0 / 255.0 alpha:1.0].CGColor;
    [self.view addSubview:self.timerButton];
    
    self.drawButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.drawButton.frame = CGRectMake(243.0f, 452.0f, 91.0f, 32.0f);
    self.drawButton.layer.borderWidth = 1;
    [self.drawButton setTitle:@"Draw"
                         forState:UIControlStateNormal];
    self.drawButton.layer.cornerRadius = 10;
    self.drawButton.layer.borderColor = [UIColor colorWithRed:33.0 / 255.0 green:176.0 / 255.0 blue:142.0 / 255.0 alpha:1.0].CGColor;
    [self.view addSubview:self.drawButton];
    
    self.shareButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.shareButton.frame = CGRectMake(243.0f, 504.0f, 91.0f, 32.0f);
    self.shareButton.layer.borderWidth = 1;
    [self.shareButton setTitle:@"Share"
                         forState:UIControlStateNormal];
    self.shareButton.layer.cornerRadius = 10;
    self.shareButton.layer.borderColor = [UIColor colorWithRed:33.0 / 255.0 green:176.0 / 255.0 blue:142.0 / 255.0 alpha:1.0].CGColor;
    [self.view addSubview:self.shareButton];
    
/*    self.myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.myButton.frame = CGRectMake(108.0f, 350.0f, 150.0f, 40.0f);
        self.myButton.layer.borderWidth = 2;
        self.myButton.layer.borderColor = [UIColor colorWithRed:128.0 / 255.0 green:164.0 / 255.0 blue:237.0 / 255.0 alpha:1.0].CGColor;
        self.myButton.layer.cornerRadius = 10;
        
        [self.myButton setTitle:@"Click"
                       forState:UIControlStateNormal];
    [self.myButton addTarget:self
                          action:@selector(drawRect:)
                forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.myButton];*/
/*
 HEAD
 
 let shape = UIBezierPath()
 shape.move(to: CGPoint(x: 61.5, y: 29))
 shape.addLine(to: CGPoint(x: 77, y: 89))
 shape.addLine(to: CGPoint(x: 89, y: 112))
 shape.addLine(to: CGPoint(x: 106.5, y: 131.5))
 shape.addLine(to: CGPoint(x: 133.5, y: 154))
 shape.addLine(to: CGPoint(x: 157, y: 159.5))
 shape.addLine(to: CGPoint(x: 193, y: 142))
 shape.addLine(to: CGPoint(x: 220, y: 112))
 shape.addLine(to: CGPoint(x: 228.5, y: 100))
 shape.addLine(to: CGPoint(x: 0, y: 77.5))
 shape.addLine(to: CGPoint(x: 230.5, y: 50.5))
 shape.addLine(to: CGPoint(x: 218.5, y: 40.5))
 shape.addLine(to: CGPoint(x: 202, y: 43.5))
 shape.addLine(to: CGPoint(x: 191, y: 60.5))
 shape.addLine(to: CGPoint(x: 189, y: 83.5))
 shape.addLine(to: CGPoint(x: 193, y: 96))
 
 let shape = UIBezierPath()
 shape.move(to: CGPoint(x: 184, y: 100))
 shape.addLine(to: CGPoint(x: 175.5, y: 98.5))
 shape.addLine(to: CGPoint(x: 166, y: 100.5))
 shape.addLine(to: CGPoint(x: 158, y: 101.5))
 shape.addLine(to: CGPoint(x: 148.5, y: 100.5))
 shape.addLine(to: CGPoint(x: 140, y: 99))
 shape.addLine(to: CGPoint(x: 133.5, y: 98.5))
 shape.addLine(to: CGPoint(x: 126, y: 100))
 shape.addLine(to: CGPoint(x: 121.5, y: 102))
 shape.addLine(to: CGPoint(x: 127.5, y: 104.5))
 shape.addLine(to: CGPoint(x: 132, y: 108))
 shape.addLine(to: CGPoint(x: 136.5, y: 113))
 shape.addLine(to: CGPoint(x: 142.5, y: 115.5))
 shape.addLine(to: CGPoint(x: 150, y: 116.5))
 shape.addLine(to: CGPoint(x: 157, y: 115.5))
 shape.addLine(to: CGPoint(x: 164.5, y: 116.5))
 shape.addLine(to: CGPoint(x: 170.5, y: 115.5))
 shape.addLine(to: CGPoint(x: 177, y: 111.5))
 shape.addLine(to: CGPoint(x: 184, y: 103.5))
 shape.addLine(to: CGPoint(x: 188.5, y: 97.5))
 shape.addLine(to: CGPoint(x: 180.5, y: 96.5))
 shape.addLine(to: CGPoint(x: 171.5, y: 95.5))
 shape.addLine(to: CGPoint(x: 162.5, y: 93.5))
 shape.addLine(to: CGPoint(x: 154, y: 93))
 shape.addLine(to: CGPoint(x: 144, y: 94.5))
 shape.addLine(to: CGPoint(x: 135, y: 96.5))
 shape.addLine(to: CGPoint(x: 125, y: 97.5))
 shape.addLine(to: CGPoint(x: 118, y: 97))
 shape.addLine(to: CGPoint(x: 127.5, y: 91))
 shape.addLine(to: CGPoint(x: 136.5, y: 84.5))
 shape.addLine(to: CGPoint(x: 142.5, y: 81))
 shape.addLine(to: CGPoint(x: 147.5, y: 82.5))
 shape.addLine(to: CGPoint(x: 153, y: 84.5))
 shape.addLine(to: CGPoint(x: 159.5, y: 83.5))
 shape.addLine(to: CGPoint(x: 166, y: 82.5))
 shape.addLine(to: CGPoint(x: 171.5, y: 0))
 shape.addLine(to: CGPoint(x: 174.5, y: 84.5))
 shape.addLine(to: CGPoint(x: 179.5, y: 89.5))
 shape.addLine(to: CGPoint(x: 187, y: 94))
 
 let shape = UIBezierPath()
 shape.move(to: CGPoint(x: 189.5, y: 102.5))
 shape.addLine(to: CGPoint(x: 194, y: 108.5))
 shape.addLine(to: CGPoint(x: 196.5, y: 115))
 shape.addLine(to: CGPoint(x: 193, y: 124))
 shape.addLine(to: CGPoint(x: 186, y: 132.5))
 shape.addLine(to: CGPoint(x: 177, y: 139.5))
 shape.addLine(to: CGPoint(x: 167.5, y: 132.5))
 shape.addLine(to: CGPoint(x: 157, y: 128.5))
 shape.addLine(to: CGPoint(x: 147.5, y: 0))
 shape.addLine(to: CGPoint(x: 135.5, y: 132.5))
 shape.addLine(to: CGPoint(x: 127.5, y: 142))
 shape.addLine(to: CGPoint(x: 121, y: 154.5))
 shape.addLine(to: CGPoint(x: 109.5, y: 147.5))
 shape.addLine(to: CGPoint(x: 101.5, y: 137.5))
 shape.addLine(to: CGPoint(x: 93, y: 128.5))
 shape.addLine(to: CGPoint(x: 0, y: 142))
 shape.addLine(to: CGPoint(x: 0, y: 170.5))
 shape.addLine(to: CGPoint(x: 0, y: 187.5))
 shape.addLine(to: CGPoint(x: 86, y: 199))
 shape.addLine(to: CGPoint(x: 74.5, y: 207.5))
 shape.addLine(to: CGPoint(x: 63.5, y: 214.5))
 shape.addLine(to: CGPoint(x: 81, y: 221))
 shape.addLine(to: CGPoint(x: 94.5, y: 229.5))
 shape.addLine(to: CGPoint(x: 105, y: 243.5))
 shape.addLine(to: CGPoint(x: 119, y: 261))
 shape.addLine(to: CGPoint(x: 138, y: 279))
 shape.addLine(to: CGPoint(x: 157, y: 285.5))
 shape.addLine(to: CGPoint(x: 171, y: 0))
 shape.addLine(to: CGPoint(x: 186, y: 277.5))
 shape.addLine(to: CGPoint(x: 199.5, y: 261))
 shape.addLine(to: CGPoint(x: 209.5, y: 239.5))
 shape.addLine(to: CGPoint(x: 219, y: 223.5))
 shape.addLine(to: CGPoint(x: 233.5, y: 217))
 shape.addLine(to: CGPoint(x: 237, y: 0))
 shape.addLine(to: CGPoint(x: 230.5, y: 201.5))
 shape.addLine(to: CGPoint(x: 221, y: 173))
 shape.addLine(to: CGPoint(x: 219, y: 150))
 shape.addLine(to: CGPoint(x: 0, y: 126.5))
 shape.addLine(to: CGPoint(x: 212, y: 137.5))
 shape.addLine(to: CGPoint(x: 204, y: 145.5))
 shape.addLine(to: CGPoint(x: 196.5, y: 154.5))
 shape.addLine(to: CGPoint(x: 180, y: 170.5))
 shape.addLine(to: CGPoint(x: 170, y: 185))
 shape.addLine(to: CGPoint(x: 161.5, y: 206.5))
 shape.addLine(to: CGPoint(x: 158.5, y: 232.5))
 shape.addLine(to: CGPoint(x: 0, y: 261))
 shape.addLine(to: CGPoint(x: 0, y: 279))
 
 
 
 */
}
//self.view.backgroundColor = [UIColor whiteColor];

-(void)drawRect: (CGRect)rect{
    
    UIBezierPath *rectanglePath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 340, 340)];
    [rectanglePath fill];
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(61.5, 29)];
    [path addLineToPoint:CGPointMake(77, 89)];
    [path addLineToPoint:CGPointMake(89, 112)];
    [path addLineToPoint:CGPointMake(106.5, 131.5)];
    [path addLineToPoint:CGPointMake(133.5, 154)];
    [path addLineToPoint:CGPointMake(157, 159.5)];
    [path addLineToPoint:CGPointMake(193, 142)];
    [path addLineToPoint:CGPointMake(220, 112)];
    [path addLineToPoint:CGPointMake(228.5, 100)];
    [path addLineToPoint:CGPointMake(0, 77.5)];
    [path addLineToPoint:CGPointMake(230.5, 50.5)];
    [path addLineToPoint:CGPointMake(218.5, 40.5)];
    [path addLineToPoint:CGPointMake(202, 43.5)];
    [path addLineToPoint:CGPointMake(191, 60.5)];
    [path addLineToPoint:CGPointMake(189, 83.5)];
    [path addLineToPoint:CGPointMake(193, 96)];
    [path closePath];
    path.lineWidth = 1;
    [[UIColor redColor] setStroke];
    [path stroke];
    
}



@end
