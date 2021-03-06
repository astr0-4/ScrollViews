//
//  ViewController.m
//  ScrollViews
//
//  Created by Alex on 2015-06-23.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) UIImageView *fieldLighthouse;
@property (nonatomic) UIImageView *nightLighthouse;
@property (nonatomic) UIImageView *plainLighthouse;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;


@end

@implementation ViewController

- (void)viewDidLoad {
       [super viewDidLoad];
       // Do any additional setup after loading the view, typically from a nib.
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int imageNumber = self.scrollView.contentOffset.x/self.scrollView.frame.size.width;
    self.pageControl.currentPage = imageNumber;
}

- (IBAction)zoomIn:(UITapGestureRecognizer *)sender {
    [self performSegueWithIdentifier:@"Zoom" sender:sender];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
     if ([[segue identifier] isEqualToString:@"Zoom"])
    {
        ViewControllerZoom *zoomView = [segue destinationViewController];
        CGPoint viewLocation = [sender locationInView:self.scrollView];
        int imageNumber = viewLocation.x/self.scrollView.frame.size.width;
        if(imageNumber == 0){
        zoomView.zoomedImage = self.fieldLighthouse.image;
        }
        else if(imageNumber == 1) {
            zoomView.zoomedImage = self.nightLighthouse.image;
        }
        else {
            zoomView.zoomedImage = self.plainLighthouse.image;
        }

    }
}

-(void)viewDidAppear:(BOOL)animated {
    self.scrollView.delegate = self;
    self.fieldLighthouse = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field.jpg"]];
    self.nightLighthouse = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night.jpg"]];
    self.plainLighthouse = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse.jpg"]];

    NSArray *lighthouses = @[self.fieldLighthouse, self.nightLighthouse, self.plainLighthouse];
    CGFloat xPosition = 0;
    
    for(UIImageView *lighthouse in lighthouses) {
        UIView *lighthouseView = [[UIView alloc] initWithFrame:(CGRect){xPosition,0,self.scrollView.frame.size.width, self.scrollView.frame.size.height}];
        
        lighthouseView = lighthouse;
        
        lighthouse.frame = CGRectMake(xPosition,0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        lighthouse.contentMode = UIViewContentModeScaleAspectFit;
        xPosition += self.scrollView.frame.size.width;
        [self.scrollView addSubview:lighthouse];
    }
    
    self.scrollView.contentSize = (CGSize){xPosition, self.scrollView.frame.size.width};
    [super viewDidAppear:YES];

}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
