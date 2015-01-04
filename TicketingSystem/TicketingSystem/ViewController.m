//
//  ViewController.m
//  TicketingSystem
//
//  Created by Frankenstein Yang on 1/3/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "ViewController.h"
#import "Ticket.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    Ticket *ticketA = [[Ticket alloc] init];
    NSLog(@"%@", ticketA);
    Ticket *ticketB = [[Ticket alloc] init];
    NSLog(@"%@", ticketB);
    
}

@end
