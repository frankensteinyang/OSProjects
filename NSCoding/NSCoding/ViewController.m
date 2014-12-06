//
//  ViewController.m
//  NSCoding
//
//  Created by Hannibal Yang on 12/6/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "ViewController.h"
#import "NSCAnimal.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)save {
    
    NSCAnimal *animal = [[NSCAnimal alloc] init];
    animal.furColor = @"Black";
    animal.weight = 420;
    animal.legs = 4;
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [path stringByAppendingPathComponent:@"test.data"];
    [NSKeyedArchiver archiveRootObject:animal toFile:filePath];
}

- (IBAction)read {
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [path stringByAppendingPathComponent:@"test.data"];
    
    NSCAnimal *animal = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@", animal.furColor);
    NSLog(@"%f", animal.weight);
    NSLog(@"%d", animal.legs);
}
@end
