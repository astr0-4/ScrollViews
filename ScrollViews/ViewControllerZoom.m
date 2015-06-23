//
//  ViewControllerZoom.m
//  ScrollViews
//
//  Created by Alex on 2015-06-23.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import "ViewControllerZoom.h"

@interface ViewControllerZoom ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@property (nonatomic) UIImageView *fieldLighthouse;
@property (nonatomic) UIImageView *nightLighthouse;
@property (nonatomic) UIImageView *plainLighthouse;

@end

@implementation ViewControllerZoom

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//
-(void)viewDidAppear:(BOOL)animated {
    self.scrollView.userInteractionEnabled = YES;
    self.scrollView.delegate = self;
    self.fieldLighthouse = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field.jpg"]];
    NSLog(@"view did appear");
    
//    self.nightLighthouse = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night.jpg"]];
//    self.plainLighthouse = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse.jpg"]];
//    
//    NSArray *lighthouses = @[self.fieldLighthouse];
//    CGFloat xPosition = 0;
//    
//    for(UIImageView *lighthouse in lighthouses) {
//        UIView *lighthouseView = [[UIView alloc] initWithFrame:(CGRect){xPosition,0,self.scrollView.frame.size.width, self.scrollView.frame.size.height}];
//
//        lighthouseView = lighthouse;
//        
        self.fieldLighthouse.frame = CGRectMake(0,0, self.scrollView.frame.size.width + 30, self.scrollView.frame.size.height + 30);
//        lighthouse.contentMode = UIViewContentModeScaleAspectFit;
//        xPosition += self.scrollView.frame.size.width;
        [self.scrollView addSubview:self.fieldLighthouse];
    self.scrollView.maximumZoomScale = 5;
    self.scrollView.minimumZoomScale = 1;

    self.scrollView.contentSize = (CGSize){self.fieldLighthouse.frame.size.width, self.fieldLighthouse.frame.size.height};
    [super viewDidAppear:YES];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    NSLog(@"view for zoom method called");
    return self.fieldLighthouse;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scroll view did scroll");
}

@end
