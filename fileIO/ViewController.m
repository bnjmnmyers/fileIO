//
//  ViewController.m
//  fileIO
//
//  Created by Benjamin Myers on 10/2/14.
//  Copyright (c) 2014 AppGuys.biz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepFileStuff{
    _fileManager = [NSFileManager defaultManager];
    _directoryPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    _directory = [_directoryPaths objectAtIndex:0];
}

- (IBAction)saveUserData:(id)sender {
    [self prepFileStuff];
    _dataFile = [_directory stringByAppendingPathComponent:_tfFileName.text];
    
    _data = [_tfUserData.text dataUsingEncoding:NSASCIIStringEncoding];
    
    [_fileManager createFileAtPath:_dataFile contents:_data attributes:nil];
    
    _saveBox.hidden = true;
    
    _alert = [[UIAlertView alloc] initWithTitle:@"File Saved" message:[NSString stringWithFormat:@"Your file: %@ was successfully saved.", _tfFileName.text] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [_alert show];
}

- (IBAction)loadData:(id)sender {
    [self prepFileStuff];
    
    _dataFile = [_directory stringByAppendingPathComponent:_tfUserData.text];
    
    if ([_fileManager fileExistsAtPath:_dataFile]) {
        NSData *data = [_fileManager contentsAtPath:_dataFile];
        NSString *contentsString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        _tfUserData.text = contentsString;
    }
    
}

- (IBAction)cancelSave:(id)sender {
    _saveBox.hidden = true;
}

- (IBAction)showSaveBox:(id)sender {
    _saveBox.hidden = false;
}
@end
