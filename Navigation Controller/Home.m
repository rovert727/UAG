//
//  ViewController.m
//  Navigation Controller
//
//  Created by Jose on 9/2/16.
//  Copyright © 2016 robert. All rights reserved.
//


#import "Home.h"

@interface Home ()
@property NSMutableArray *destinationTitles;
@property NSMutableArray *destinationDescriptions;
@property NSMutableArray *destinationPhotos;

@property NSString *stTitleSelected;
@property NSString *stDescriptionSelected;
@property NSString *stPhotoSelected;

@end

@implementation Home
/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}
//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-------------------------------------------------------------------------------
- (void)initController {
    self.destinationTitles          = [[NSMutableArray alloc] initWithObjects: @"Marruecos", @"Ibiza", @"Cancún", @"Islas Griegas", @"Islandia", nil];
    self.destinationPhotos          = [[NSMutableArray alloc] initWithObjects: @"destination01.png", @"destination02.png", @"destination03.png", @"destination04.png", @"destination05.png", nil];
    self.destinationDescriptions   = [[NSMutableArray alloc] initWithObjects: @"Destino de lujo para almas aventureras que buscan libertad", @"Destino de lujo para almas aventureras que buscan libertad", @"Destino de lujo para almas aventureras que buscan libertad", @"Destino de lujo para almas aventureras que buscan libertad", @"Destino de lujo para almas aventureras que buscan libertad", nil];
}
/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.destinationTitles.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 190;
}
//-------------------------------------------------------------------------------
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
        //1. Setup the CATransform3D structure
        CATransform3D rotation;
        rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
        rotation.m34 = 1.0/ -600;
        
        //2. Define the initial state (Before the animation)
        cell.layer.shadowColor = [[UIColor blackColor]CGColor];
        cell.layer.shadowOffset = CGSizeMake(10, 10);
        cell.alpha = 0;
        
        cell.layer.transform = rotation;
        cell.layer.anchorPoint = CGPointMake(0, 0.5);
        
        //3. Define the final state (After the animation) and commit the animation
        [UIView beginAnimations:@"rotation" context:NULL];
        [UIView setAnimationDuration:0.4];
        cell.layer.transform = CATransform3DIdentity;
        cell.alpha = 1;
        cell.layer.shadowOffset = CGSizeMake(0, 0);
        
        //Reassure that cell its in its place (WaGo)
        cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
        [UIView commitAnimations];
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellHome *cell = (cellHome *)[tableView dequeueReusableCellWithIdentifier:@"cellHome"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellHome" bundle:nil] forCellReuseIdentifier:@"cellHome"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellHome"];
    }
    //Fill cell with info from arrays
    cell.lblDestinationTitle.text   = self.destinationTitles[indexPath.row];
    cell.lblDescription.text        = self.destinationDescriptions[indexPath.row];
    cell.imgDestination.image       = [UIImage imageNamed:self.destinationPhotos[indexPath.row]];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.stTitleSelected        = self.destinationTitles[indexPath.row];
    self.stDescriptionSelected  = self.destinationDescriptions[indexPath.row];
    self.stPhotoSelected        = self.destinationPhotos[indexPath.row];
    [self performSegueWithIdentifier:@"DestinationDetails" sender:self];
}
/**********************************************************************************************/
#pragma mark - Navigation
/**********************************************************************************************/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[DestinationDetails class]]) {
        DestinationDetails *destination     = [segue destinationViewController];
        destination.destinationTitle        = self.stTitleSelected;
        destination.destinationDescription  = self.stDescriptionSelected;
        destination.destinationPhoto        = self.stPhotoSelected;
        
    }
}








@end
