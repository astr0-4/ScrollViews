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


@property (nonatomic) UIImageView *lighthouse;

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
    
    self.lighthouse = [[UIImageView alloc] initWithImage:self.zoomedImage];
    //put in 4 constraints to pin to top left bottom right scrollview
    
    [self.scrollView addSubview:self.lighthouse];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.lighthouse
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.scrollView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.lighthouse
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.scrollView
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.lighthouse
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.scrollView
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.lighthouse
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.scrollView
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    self.scrollView.maximumZoomScale = 5;
    self.scrollView.minimumZoomScale = 0.25;
    
    [super viewDidAppear:YES];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return [self.scrollView.subviews firstObject];
}



@end
