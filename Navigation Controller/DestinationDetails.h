//
//  DestinationDetails.h
//  Navigation Controller
//
//  Created by Jose on 9/2/16.
//  Copyright © 2016 robert. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "PayPalMobile.h"

@interface DestinationDetails : UIViewController
@property NSString *destinationTitle;
@property NSString *destinationDescription;
@property NSString *destinationPhoto;

@property (strong, nonatomic) IBOutlet UIImageView *imgDestination;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;

@end
