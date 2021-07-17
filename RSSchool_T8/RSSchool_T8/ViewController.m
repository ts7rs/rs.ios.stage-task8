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
    
    //(__bridge CGColorRef _Nullable)([UIColor colorWithRed:0.0 /255.0 green:178.0 / 255.0 blue:255.0 / 255.0 alpha:0.25]);
    [self.view.layer addSublayer:subLayerCanvas];
    
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
/*-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell*) tableView: (UITableView*)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"Artist";
    return  cell;
}
-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
}*/
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
