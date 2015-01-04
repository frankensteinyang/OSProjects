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
    Ticket *ticketA = [Ticket sharedTicket];
    [Ticket sharedTicket].tickets = 30;
    NSLog(@"%@", ticketA);
    
    Ticket *ticketB = [Ticket sharedTicket];
    NSLog(@"%@ %d", ticketB, ticketB.tickets);
    
}

@end
