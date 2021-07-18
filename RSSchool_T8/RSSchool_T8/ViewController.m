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
@synthesize paletteButton, timerButton, drawButton, shareButton, drawingsButton, redButton, darkBlueButton, greenButton, greyButton, violetButton, peachButton, orangeButton, blueButton, pinkButton, darkGreyButton, darkGreenButton, brownButton;
@synthesize colorView;
@synthesize color;
@synthesize color1, color2, color3;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

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
    [self.paletteButton addTarget:self
                          action:@selector(paletteButtonIsPressed:)
                forControlEvents:UIControlEventTouchDown];
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

    /*CGRect viewRect = CGRectMake(0, 333, 375, 333.5);
     UIView *colorView = [[UIView alloc] initWithFrame:viewRect];
     colorView.backgroundColor = [UIColor whiteColor];
     [self.view addSubview:colorView];*/
    
    self.redButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.redButton.frame = CGRectMake(17.0f, 425.0f, 24.0f, 24.0f);
    self.redButton.layer.cornerRadius = 6;
    self.redButton.layer.backgroundColor = [UIColor colorWithRed:226.0 / 255.0 green:27.0 / 255.0 blue:44.0 / 255.0 alpha:1.0].CGColor;
    [self.redButton addTarget:self
                         action:@selector(redButtonIsPressed:)
               forControlEvents:UIControlEventTouchUpInside];
    
    [self.redButton setTag:1];
    [self.view addSubview:redButton];
    
    
    self.darkBlueButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.darkBlueButton.frame = CGRectMake(72.0f, 425.0f, 24.0f, 24.0f);
    self.darkBlueButton.layer.cornerRadius = 6;
    self.darkBlueButton.layer.backgroundColor = [UIColor colorWithRed:62.0 / 255.0 green:23.0 / 255.0 blue:204.0 / 255.0 alpha:1.0].CGColor;
    [self.darkBlueButton addTarget:self
                         action:@selector(darkBlueButtonIsPressed:)
               forControlEvents:UIControlEventTouchUpInside];
    [self.darkBlueButton setTag:2];
    [self.view addSubview:darkBlueButton];
    
    self.greenButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.greenButton.frame = CGRectMake(127.0f, 425.0f, 24.0f, 24.0f);
    self.greenButton.layer.cornerRadius = 6;
    self.greenButton.layer.backgroundColor = [UIColor colorWithRed:0 / 255.0 green:124.0 / 255.0 blue:55.0 / 255.0 alpha:1.0].CGColor;
    [self.greenButton addTarget:self
                         action:@selector(greenButtonIsPressed:)
               forControlEvents:UIControlEventTouchUpInside];
    [self.greenButton setTag:3];
    [self.view addSubview:greenButton];
    
    self.greyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.greyButton.frame = CGRectMake(182.0f, 425.0f, 24.0f, 24.0f);
    self.greyButton.layer.cornerRadius = 6;
    self.greyButton.layer.backgroundColor = [UIColor colorWithRed:128 / 255.0 green:128.0 / 255.0 blue:128.0 / 255.0 alpha:1.0].CGColor;
    [self.greyButton addTarget:self
                         action:@selector(greyButtonIsPressed:)
               forControlEvents:UIControlEventTouchUpInside];
    [self.greyButton setTag:4];
    [self.view addSubview:greyButton];
    
    self.violetButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.violetButton.frame = CGRectMake(237.0f, 425.0f, 24.0f, 24.0f);
    self.violetButton.layer.cornerRadius = 6;
    self.violetButton.layer.backgroundColor = [UIColor colorWithRed:157 / 255.0 green:94.0 / 255.0 blue:234.0 / 255.0 alpha:1.0].CGColor;
    [self.violetButton addTarget:self
                         action:@selector(violetButtonIsPressed:)
               forControlEvents:UIControlEventTouchUpInside];
    [self.violetButton setTag:5];
    [self.view addSubview:violetButton];
    
    self.peachButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.peachButton.frame = CGRectMake(292.0f, 425.0f, 24.0f, 24.0f);
    self.peachButton.layer.cornerRadius = 6;
    self.peachButton.layer.backgroundColor = [UIColor colorWithRed:255 / 255.0 green:122.0 / 255.0 blue:104.0 / 255.0 alpha:1.0].CGColor;
    [self.peachButton addTarget:self
                         action:@selector(peachButtonIsPressed:)
               forControlEvents:UIControlEventTouchUpInside];
    [self.peachButton setTag:5];
    [self.view addSubview:peachButton];
    
    self.orangeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.orangeButton.frame = CGRectMake(17.0f, 470.0f, 24.0f, 24.0f);
    self.orangeButton.layer.cornerRadius = 6;
    self.orangeButton.layer.backgroundColor = [UIColor colorWithRed:255.0 / 255.0 green:173.0 / 255.0 blue:84.0 / 255.0 alpha:1.0].CGColor;
    [self.orangeButton addTarget:self
                         action:@selector(orangeButtonIsPressed:)
               forControlEvents:UIControlEventTouchUpInside];
    [self.orangeButton setTag:7];
    [self.view addSubview:orangeButton];
    
    self.blueButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.blueButton.frame = CGRectMake(72.0f, 470.0f, 24.0f, 24.0f);
    self.blueButton.layer.cornerRadius = 6;
    self.blueButton.layer.backgroundColor = [UIColor colorWithRed:0 / 255.0 green:174.0 / 255.0 blue:237.0 / 255.0 alpha:1.0].CGColor;
    [self.blueButton addTarget:self
                         action:@selector(blueButtonIsPressed:)
               forControlEvents:UIControlEventTouchUpInside];
    [self.blueButton setTag:8];
    [self.view addSubview:blueButton];
    
    self.pinkButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.pinkButton.frame = CGRectMake(127.0f, 470.0f, 24.0f, 24.0f);
    self.pinkButton.layer.cornerRadius = 6;
    self.pinkButton.layer.backgroundColor = [UIColor colorWithRed:255 / 255.0 green:119.0 / 255.0 blue:162.0 / 255.0 alpha:1.0].CGColor;
    [self.pinkButton addTarget:self
                         action:@selector(pinkButtonIsPressed:)
               forControlEvents:UIControlEventTouchUpInside];
    
    [self.pinkButton setTag:9];
    [self.view addSubview:pinkButton];
    
    self.darkGreyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.darkGreyButton.frame = CGRectMake(182.0f, 470.0f, 24.0f, 24.0f);
    self.darkGreyButton.layer.cornerRadius = 6;
    self.darkGreyButton.layer.backgroundColor = [UIColor colorWithRed:0 / 255.0 green:46.0 / 255.0 blue:60.0 / 255.0 alpha:1.0].CGColor;
    [self.darkGreyButton addTarget:self
                         action:@selector(darkGreyButtonIsPressed:)
               forControlEvents:UIControlEventTouchUpInside];
    
    [self.darkGreyButton setTag:10];
    [self.view addSubview:darkGreyButton];
    
    self.darkGreenButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.darkGreenButton.frame = CGRectMake(237.0f, 470.0f, 24.0f, 24.0f);
    self.darkGreenButton.layer.cornerRadius = 6;
    self.darkGreenButton.layer.backgroundColor = [UIColor colorWithRed:14 / 255.0 green:55.0 / 255.0 blue:24.0 / 255.0 alpha:1.0].CGColor;
    [self.darkGreenButton addTarget:self
                         action:@selector(darkGreenButtonIsPressed:)
               forControlEvents:UIControlEventTouchUpInside];
    
    [self.darkGreenButton setTag:11];
    [self.view addSubview:darkGreenButton];
    
    self.brownButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.brownButton.frame = CGRectMake(292.0f, 470.0f, 24.0f, 24.0f);
    self.brownButton.layer.cornerRadius = 6;
    self.brownButton.layer.backgroundColor = [UIColor colorWithRed:97 / 255.0 green:15.0 / 255.0 blue:16.0 / 255.0 alpha:1.0].CGColor;
    [self.brownButton addTarget:self
                         action:@selector(brownButtonIsPressed:)
               forControlEvents:UIControlEventTouchUpInside];
    
    [self.brownButton setTag:12];
    [self.view addSubview:brownButton];

}

- (void) redButtonIsPressed:(UIButton *)paramSender{
    NSLog(@"red");
    color1 = @1;
}
- (void) darkBlueButtonIsPressed:(UIButton *)paramSender{
    NSLog(@"dark blue");
    color1 = @2;
}
- (void) greenButtonIsPressed:(UIButton *)paramSender{
    NSLog(@"green");
    color1 = @3;
}
- (void) greyButtonIsPressed:(UIButton *)paramSender{
    NSLog(@"grey");
    color1 = @4;
}
- (void) violetButtonIsPressed:(UIButton *)paramSender{
    NSLog(@"violet");
    color1 = @5;
}
- (void) peachButtonIsPressed:(UIButton *)paramSender{
    NSLog(@"peach");
    color1 = @6;
}
- (void) orangeButtonIsPressed:(UIButton *)paramSender{
    NSLog(@"orange");
    color1 = @7;
}
- (void) blueButtonIsPressed:(UIButton *)paramSender{
    NSLog(@"blue");
    color1 = @8;
}
- (void) pinkButtonIsPressed:(UIButton *)paramSender{
    NSLog(@"pink");
    color1 = @9;
}
- (void) darkGreyButtonIsPressed:(UIButton *)paramSender{
    NSLog(@"dark grey");
    color1 = @10;
}
- (void) darkGreenButtonIsPressed:(UIButton *)paramSender{
    NSLog(@"dark green");
    color1 = @11;
}
- (void) brownButtonIsPressed:(UIButton *)paramSender{
    NSLog(@"dark green");
    color1 = @12;
}

- (void) paletteButtonIsPressed:(UIButton *)paramSender{
    CGRect viewRect = CGRectMake(0, 333, 375, 333.5);
    UIView *colorView = [[UIView alloc] initWithFrame:viewRect];
    colorView.backgroundColor = [UIColor redColor];
    [self.view addSubview:colorView];
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
    bezier.strokeColor   = [UIColor colorWithRed:0 / 255.0 green:0 / 255.0 blue:0 / 255.0 alpha:1.0].CGColor;
    NSLog(@"color1 %@", color1);

    if([color1  isEqual: @1]){
        bezier.strokeColor   = [UIColor colorWithRed:226.0 / 255.0 green:27.0 / 255.0 blue:44.0 / 255.0 alpha:1.0].CGColor;
        NSLog(@"@1 %@", color1);
    }
    
    if([color1  isEqual: @2]){
        bezier.strokeColor   = [UIColor colorWithRed:62.0 / 255.0 green:23.0 / 255.0 blue:204.0 / 255.0 alpha:1.0].CGColor;
        NSLog(@"@2 %@", color1);
    }
    
    if([color1  isEqual: @3]){
        bezier.strokeColor   = [UIColor colorWithRed:0 / 255.0 green:124.0 / 255.0 blue:55.0 / 255.0 alpha:1.0].CGColor;
        NSLog(@"@3 %@", color1);
    }
    
    if([color1  isEqual: @4]){
        bezier.strokeColor   = [UIColor colorWithRed:128 / 255.0 green:128.0 / 255.0 blue:128.0 / 255.0 alpha:1.0].CGColor; 
        NSLog(@"@4 %@", color1);
    }
    
    if([color1  isEqual: @5]){
        bezier.strokeColor   = [UIColor colorWithRed:157 / 255.0 green:94.0 / 255.0 blue:234.0 / 255.0 alpha:1.0].CGColor;
        NSLog(@"@5 %@", color1);
    }
    
    if([color1  isEqual: @6]){
        bezier.strokeColor   = [UIColor colorWithRed:255 / 255.0 green:122.0 / 255.0 blue:104.0 / 255.0 alpha:1.0].CGColor;
        NSLog(@"@6 %@", color1);
    }
    
    if([color1  isEqual: @7]){
        bezier.strokeColor   = [UIColor colorWithRed:255.0 / 255.0 green:173.0 / 255.0 blue:84.0 / 255.0 alpha:1.0].CGColor;
        NSLog(@"@7 %@", color1);
    }
    
    if([color1  isEqual: @8]){
        bezier.strokeColor   = [UIColor colorWithRed:0 / 255.0 green:174.0 / 255.0 blue:237.0 / 255.0 alpha:1.0].CGColor;
        NSLog(@"@8 %@", color1);
    }
    
    if([color1  isEqual: @9]){
        bezier.strokeColor   = [UIColor colorWithRed:255 / 255.0 green:119.0 / 255.0 blue:162.0 / 255.0 alpha:1.0].CGColor;
        NSLog(@"@9 %@", color1);
    }
    
    if([color1  isEqual: @10]){
        bezier.strokeColor   = [UIColor colorWithRed:0 / 255.0 green:46.0 / 255.0 blue:60.0 / 255.0 alpha:1.0].CGColor;
        NSLog(@"@10 %@", color1);
    }
    
    if([color1  isEqual: @11]){
        bezier.strokeColor   = [ UIColor colorWithRed:14 / 255.0 green:55.0 / 255.0 blue:24.0 / 255.0 alpha:1.0].CGColor;
        NSLog(@"@11 %@", color1);
    }
    
    if([color1  isEqual: @12]){
        bezier.strokeColor   = [UIColor colorWithRed:97 / 255.0 green:15.0 / 255.0 blue:16.0 / 255.0 alpha:1.0].CGColor;
        NSLog(@"@12 %@", color1);
    }

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
