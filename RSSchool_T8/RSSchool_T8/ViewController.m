//
//  ViewController.m
//  RSSchool_T8
//
//  Created by Taisia Kataieva on 16.7.21..
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate>
@property(strong, nonatomic) UITableView *headerArtist;
@end

@implementation ViewController
@synthesize path;
@synthesize test;
@synthesize paletteButton, timerButton, drawButton, shareButton, drawingsButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   /* self.headerArtist = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.headerArtist.delegate = self;
    [self.view addSubview: self.headerArtist];*/
  
    UINavigationBar* navigationbar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, UIApplication.sharedApplication.statusBarFrame.size.height, self.view.frame.size.width, 50)];
    
    UINavigationItem* navigationItem = [[UINavigationItem alloc] initWithTitle:@"Artist"];
    [navigationbar setTintColor:[UIColor whiteColor]];
    [navigationbar setTranslucent:NO];
    [navigationbar setItems:@[navigationItem]];
    [self.view addSubview:navigationbar];
    
    
    self.drawingsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.drawingsButton.frame = CGRectMake(250.0f, 20.0f, 97, 42);
    self.drawingsButton.layer.borderWidth = 0;
    [drawingsButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:17.0]];
    [self.drawingsButton setTitle:@"Drawings"
                         forState:UIControlStateNormal];
    [drawingsButton setTitleColor:[UIColor colorWithRed:33/255.0 green:176/255.0 blue:142/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.view addSubview:self.drawingsButton];
    
    self.paletteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.paletteButton.frame = CGRectMake(20.0f, 452.0f, 163.0f, 32.0f);
    self.paletteButton.layer.borderWidth = 1;
    [paletteButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Medium" size:18.0]];
    [self.paletteButton setTitle:@"Open Palette"
                         forState:UIControlStateNormal];
    [paletteButton setTitleColor:[UIColor colorWithRed:33/255.0 green:176/255.0 blue:142/255.0 alpha:1.0] forState:UIControlStateNormal];
    self.paletteButton.layer.cornerRadius = 10;
    self.paletteButton.layer.borderColor = [UIColor colorWithRed:33.0 / 255.0 green:176.0 / 255.0 blue:142.0 / 255.0 alpha:1.0].CGColor;
    [self.view addSubview:self.paletteButton];
    
    self.timerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.timerButton.frame = CGRectMake(20.0f, 504.0f, 151.0f, 32.0f);
    self.timerButton.layer.borderWidth = 1;
    [paletteButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Medium" size:18.0]];
    [self.timerButton setTitle:@"Open Timer"
                         forState:UIControlStateNormal];
    [timerButton setTitleColor:[UIColor colorWithRed:33/255.0 green:176/255.0 blue:142/255.0 alpha:1.0] forState:UIControlStateNormal];
    self.timerButton.layer.cornerRadius = 10;
    self.timerButton.layer.borderColor = [UIColor colorWithRed:33.0 / 255.0 green:176.0 / 255.0 blue:142.0 / 255.0 alpha:1.0].CGColor;
    [self.view addSubview:self.timerButton];
    
    self.drawButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.drawButton.frame = CGRectMake(243.0f, 452.0f, 91.0f, 32.0f);
    self.drawButton.layer.borderWidth = 1;
    [drawButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Medium" size:18.0]];
    [self.drawButton setTitle:@"Draw"
                         forState:UIControlStateNormal];
    [drawButton setTitleColor:[UIColor colorWithRed:33/255.0 green:176/255.0 blue:142/255.0 alpha:1.0] forState:UIControlStateNormal];
    self.drawButton.layer.cornerRadius = 10;
    self.drawButton.layer.borderColor = [UIColor colorWithRed:33.0 / 255.0 green:176.0 / 255.0 blue:142.0 / 255.0 alpha:1.0].CGColor;
    [self.drawButton addTarget:self
                          action:@selector(buttonIsPressed:)
                forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.drawButton];
    
    self.shareButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.shareButton.frame = CGRectMake(243.0f, 504.0f, 91.0f, 32.0f);
    self.shareButton.layer.borderWidth = 1;
    [shareButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Medium" size:18.0]];
    [self.shareButton setTitle:@"Share"
                         forState:UIControlStateNormal];
    [shareButton setTitleColor:[UIColor colorWithRed:33/255.0 green:176/255.0 blue:142/255.0 alpha:1.0] forState:UIControlStateNormal];
    self.shareButton.layer.cornerRadius = 10;
    self.shareButton.layer.borderColor = [UIColor colorWithRed:33.0 / 255.0 green:176.0 / 255.0 blue:142.0 / 255.0 alpha:1.0].CGColor;
    [self.shareButton setEnabled:NO];
    self.shareButton.layer.opacity = 0.5;
    [self.view addSubview:self.shareButton];
    
    
    CALayer *subLayerCanvas = [CALayer layer];
    subLayerCanvas.backgroundColor = [UIColor whiteColor].CGColor;
    subLayerCanvas.frame = CGRectMake(38, 102, 300, 300);
    subLayerCanvas.borderColor = [UIColor whiteColor].CGColor;
    subLayerCanvas.borderWidth = 1;
    subLayerCanvas.cornerRadius = 8;
    subLayerCanvas.shadowColor = [UIColor colorWithRed:0.0 /255.0 green:178.0 / 255.0 blue:255.0 / 255.0 alpha:0.25].CGColor;
    subLayerCanvas.shadowOpacity = 0.25;
    subLayerCanvas.shadowRadius = 8;
    
    [self.view.layer addSublayer:subLayerCanvas];
    
/*
 HEAD
 
 */
}

- (void) buttonIsPressed:(UIButton *)paramSender{

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
   /* [path addLineToPoint:CGPointMake(0, 77.5)];
    [path addLineToPoint:CGPointMake(230.5, 50.5)];
    [path addLineToPoint:CGPointMake(218.5, 40.5)];
    [path addLineToPoint:CGPointMake(202, 43.5)];
    [path addLineToPoint:CGPointMake(191, 60.5)];
    [path addLineToPoint:CGPointMake(189, 83.5)];
    [path addLineToPoint:CGPointMake(193, 96)];
    [path closePath];*/
    
   [path moveToPoint:CGPointMake(184, 100)];
    [path addLineToPoint:CGPointMake(175.5, 98.5)];
    [path addLineToPoint:CGPointMake(166, 100.5)];
    [path addLineToPoint:CGPointMake(158.5, 101.5)];
    [path addLineToPoint:CGPointMake(148.5, 100.5)];
    [path addLineToPoint:CGPointMake(140, 99)];
    [path addLineToPoint:CGPointMake(133.5, 98.5)];
    [path addLineToPoint:CGPointMake(126, 100)];
    [path addLineToPoint:CGPointMake(121.5, 102)];
    [path addLineToPoint:CGPointMake(127.5, 104.5)];
    [path addLineToPoint:CGPointMake(136.5, 113)];
    [path addLineToPoint:CGPointMake(142.5, 115.5)];
    [path addLineToPoint:CGPointMake(150, 116.5)];
    [path addLineToPoint:CGPointMake(157, 115.5)];
    [path addLineToPoint:CGPointMake(164.5, 116.5)];
    [path addLineToPoint:CGPointMake(170.5, 115.5)];
    [path addLineToPoint:CGPointMake(177, 111.5)];
    [path addLineToPoint:CGPointMake(184, 103.5)];
    [path addLineToPoint:CGPointMake(188.5, 97.5)];
    [path addLineToPoint:CGPointMake(180.5, 96.5)];
    [path addLineToPoint:CGPointMake(171.5, 95.5)];
    [path addLineToPoint:CGPointMake(162.5, 93.5)];
    [path addLineToPoint:CGPointMake(154, 93)];
    [path addLineToPoint:CGPointMake(144, 94.5)];
    [path addLineToPoint:CGPointMake(135, 96.5)];
    [path addLineToPoint:CGPointMake(125, 97.5)];
    [path addLineToPoint:CGPointMake(118, 97)];
    [path addLineToPoint:CGPointMake(127.5, 91)];
    [path addLineToPoint:CGPointMake(136.5, 84.5)];
    [path addLineToPoint:CGPointMake(142.5, 81)];
    [path addLineToPoint:CGPointMake(147.5, 82.5)];
    [path addLineToPoint:CGPointMake(153, 84.5)];
    [path addLineToPoint:CGPointMake(159.5, 83.5)];
    [path addLineToPoint:CGPointMake(166, 82.5)];
   // [path addLineToPoint:CGPointMake(171.5, 0)];
  //  [path addLineToPoint:CGPointMake(174.5, 84.5)];
  //  [path addLineToPoint:CGPointMake(179.5, 89.5)];
   // [path addLineToPoint:CGPointMake(187, 94)];
   // [path addLineToPoint:CGPointMake(174.5, 84.5)];
   // [path addLineToPoint:CGPointMake(174.5, 84.5)];
   // [path addLineToPoint:CGPointMake(174.5, 84.5)];
   // [path addLineToPoint:CGPointMake(174.5, 84.5)];
    [path closePath];
    
   [path moveToPoint:CGPointMake(189.5, 102.5)];
   // [path addLineToPoint:CGPointMake(194, 108.5)];
   // [path addLineToPoint:CGPointMake(196.5, 115)];
   // [path addLineToPoint:CGPointMake(193, 124)];
   // [path addLineToPoint:CGPointMake(186, 132.5)];
   // [path addLineToPoint:CGPointMake(177, 139.5)];
   // [path addLineToPoint:CGPointMake(167.5, 132.5)];
    //[path addLineToPoint:CGPointMake(157, 128.5)];
  //  [path addLineToPoint:CGPointMake(147.5, 0)];
   // [path addLineToPoint:CGPointMake(135.5, 132.5)];
   // [path addLineToPoint:CGPointMake(127.5, 142)];
    //[path addLineToPoint:CGPointMake(121, 154.5)];
    //[path addLineToPoint:CGPointMake(109.5, 147.5)];
    [path addLineToPoint:CGPointMake(101.5, 137.5)];
    [path addLineToPoint:CGPointMake(93, 128.5)];
   // [path addLineToPoint:CGPointMake(0, 142)];
   // [path addLineToPoint:CGPointMake(0, 170.5)];
   // [path addLineToPoint:CGPointMake(0, 187.5)];
    [path addLineToPoint:CGPointMake(86, 199)];
    [path addLineToPoint:CGPointMake(74.5, 207.5)];
    [path addLineToPoint:CGPointMake(63.5, 214.5)];
    [path addLineToPoint:CGPointMake(81, 221)];
    [path addLineToPoint:CGPointMake(94.5, 229.5)];
    [path addLineToPoint:CGPointMake(105, 243.5)];
    [path addLineToPoint:CGPointMake(119, 261)];
    [path addLineToPoint:CGPointMake(138, 279)];
    [path addLineToPoint:CGPointMake(157, 285.5)];
   // [path addLineToPoint:CGPointMake(171, 0)];
    [path addLineToPoint:CGPointMake(186, 277.5)];
    [path addLineToPoint:CGPointMake(199.5, 261)];
    [path addLineToPoint:CGPointMake(209.5, 239.5)];
    [path addLineToPoint:CGPointMake(219, 223.5)];
    [path addLineToPoint:CGPointMake(233.5, 217)];
   // [path addLineToPoint:CGPointMake(237, 0)];
    [path addLineToPoint:CGPointMake(230.5, 201.5)];
    [path addLineToPoint:CGPointMake(221, 173)];
    [path addLineToPoint:CGPointMake(219, 150)];
  //  [path addLineToPoint:CGPointMake(0, 126.5)];
    [path addLineToPoint:CGPointMake(212, 137.5)];
    [path addLineToPoint:CGPointMake(204, 145.5)];
    [path addLineToPoint:CGPointMake(196.5, 154.5)];
    [path addLineToPoint:CGPointMake(180, 170.5)];
    [path addLineToPoint:CGPointMake(170, 185)];
   // [path addLineToPoint:CGPointMake(161.5, 206.5)];
    //[path addLineToPoint:CGPointMake(158.5, 232.5)];
   // [path addLineToPoint:CGPointMake(0, 261)];
   // [path addLineToPoint:CGPointMake(0, 279)];
    
    [path closePath];
    
    CAShapeLayer *bezier = [[CAShapeLayer alloc] init];

    bezier.path          = path.CGPath;
    bezier.strokeColor   = [UIColor blackColor].CGColor;
    bezier.fillColor     = [UIColor clearColor].CGColor;
    bezier.lineWidth     = 1.0;
    bezier.strokeStart   = 0.0;
    bezier.strokeEnd     = 1.0;
    bezier.position=CGPointMake(38.0,102.0);
    [self.view.layer addSublayer:bezier];
    
    CABasicAnimation *animateStrokeEnd = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animateStrokeEnd.duration  = 10.0;
    animateStrokeEnd.fromValue = [NSNumber numberWithFloat:0.0f];
    animateStrokeEnd.toValue   = [NSNumber numberWithFloat:1.0f];
    [bezier addAnimation:animateStrokeEnd forKey:@"strokeEndAnimation"];
    
}



@end
