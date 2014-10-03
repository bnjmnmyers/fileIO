//
//  ViewController.h
//  fileIO
//
//  Created by Benjamin Myers on 10/2/14.
//  Copyright (c) 2014 AppGuys.biz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *tfUserData;
@property (weak, nonatomic) IBOutlet UITextField *tfFileName;

@property (weak, nonatomic) NSFileManager *fileManager;
@property (weak, nonatomic) NSData *data;
@property (weak, nonatomic) NSString *dataFile;
@property (weak, nonatomic) NSString *directory;
@property (weak, nonatomic) NSArray *directoryPaths;
@property (weak, nonatomic) IBOutlet UIView *saveBox;

@property (strong, nonatomic) UIAlertView *alert;

- (IBAction)saveUserData:(id)sender;
- (IBAction)loadData:(id)sender;
- (IBAction)cancelSave:(id)sender;
- (IBAction)showSaveBox:(id)sender;

@end

