//
//  ViewController.m
//  TicTacToe
//
//  Created by Vik Denic on 5/15/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabelOne;
@property (weak, nonatomic) IBOutlet UILabel *myLabelTwo;
@property (weak, nonatomic) IBOutlet UILabel *myLabelThree;
@property (weak, nonatomic) IBOutlet UILabel *myLabelFour;
@property (weak, nonatomic) IBOutlet UILabel *myLabelFive;
@property (weak, nonatomic) IBOutlet UILabel *myLabelSix;
@property (weak, nonatomic) IBOutlet UILabel *myLabelSeven;
@property (weak, nonatomic) IBOutlet UILabel *myLabelEight;
@property (weak, nonatomic) IBOutlet UILabel *myLabelNine;
@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;
@property (nonatomic) int testInt;
@property (assign) BOOL catChecker;

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.testInt = 1;
}


//-(void)findLabelUsingPoint:(CGPoint)tapRecognizer{
//
//}

//helper method
-(BOOL)changePlayer:(UILabel *)tappedLabel
{
    self.testInt += 1; //or ++
    if(self.testInt % 2 == 0){
        tappedLabel.text = @"X";
        tappedLabel.textColor = [UIColor blueColor];
        self.whichPlayerLabel.text = @"Player 1";
        return NO;
    }
    else{
        tappedLabel.text =@"O";
        self.whichPlayerLabel.text = @"Player 2";
        tappedLabel.textColor = [UIColor redColor];
        return YES;
    }

}


-(IBAction)onLabelTapped:(UITapGestureRecognizer *)tapRecognizer{
    CGPoint point;
    point = [tapRecognizer locationInView:self.view];
//    NSLog(@"%@", NSStringFromCGPoint(point) );

    if(CGRectContainsPoint(self.myLabelOne.frame, point)){
        [self changePlayer:self.myLabelOne];
    }
    if (CGRectContainsPoint(self.myLabelTwo.frame, point)) {
        [self changePlayer:self.myLabelTwo];
    }
    if (CGRectContainsPoint(self.myLabelThree.frame, point)) {
        [self changePlayer:self.myLabelThree];
    }
    if (CGRectContainsPoint(self.myLabelFour.frame, point)) {
        [self changePlayer:self.myLabelFour];
    }
    if (CGRectContainsPoint(self.myLabelFive.frame, point)) {
        [self changePlayer:self.myLabelFive];
    }
    if (CGRectContainsPoint(self.myLabelSix.frame, point)) {
        [self changePlayer:self.myLabelSix];
    }
    if (CGRectContainsPoint(self.myLabelSeven.frame, point)) {
        [self changePlayer:self.myLabelSeven];
    }
    if (CGRectContainsPoint(self.myLabelEight.frame, point)) {
        [self changePlayer:self.myLabelEight];
    }
    if (CGRectContainsPoint(self.myLabelNine.frame, point)) {
        [self changePlayer:self.myLabelNine];
    }

    [self whoWon:self.myLabelTwo :self.myLabelFive :self.myLabelEight];
    [self whoWon:self.myLabelThree :self.myLabelSix :self.myLabelNine];
    [self whoWon:self.myLabelOne :self.myLabelFour :self.myLabelSeven];
    [self whoWon:self.myLabelOne :self.myLabelTwo :self.myLabelThree];
    [self whoWon:self.myLabelFour :self.myLabelFive :self.myLabelSix];
    [self whoWon:self.myLabelSeven :self.myLabelEight :self.myLabelNine];
    [self whoWon:self.myLabelOne :self.myLabelFive :self.myLabelNine];
    [self whoWon:self.myLabelSeven :self.myLabelFive :self.myLabelThree];




//calling whoWon helper method here

    //test each possible winning combo with each click
//    if 258
//    if 369
//    if 147
//    if 123
//    if 456
//    if 789
//    if 159
//    if 753
//    alert view winner

}

//create an alert that displays one of two variable: player 1 or player 2
//based on if there is a trio of x's or o's
//the dismiss of the alert should reset the game

-(BOOL)whoWon:(UILabel *)testLabel1 : (UILabel *)testLabel2 : (UILabel *)testLabel3
{

    if ([testLabel1.text isEqual: @"X" ] && [testLabel2.text isEqual: @"X"] && [testLabel3.text isEqual: @"X" ] )
    {
        UIAlertView *xWon = [[UIAlertView alloc]initWithTitle:@"We have a winner!" message:@"X Win" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [xWon show];
        //CATSGAME NOT TRUE
//        [self.catChecker = NO];
    }

    else if ([testLabel1.text isEqual: @"O" ] && [testLabel2.text isEqual: @"O"] && [testLabel3.text isEqual: @"O" ] )
    {
        UIAlertView *oWon = [[UIAlertView alloc]initWithTitle:@"We have a winner!" message:@"O Win" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [oWon show];
        //CATSGAME NOT TRUE
//        [self.catChecker = NO];
    }

    return YES;
}

//cats game method
////checking if each space isn't empty
//-(BOOL)checkForCat{
//
//        if (![self.myLabelOne.text isEqualToString:@""]
//            && ![self.myLabelTwo.text isEqualToString:@""]
//            && ![self.myLabelThree.text isEqualToString:@""]
//            && ![self.myLabelFour.text isEqualToString:@""]
//            && ![self.myLabelFive.text isEqualToString:@""]
//            && ![self.myLabelSix.text isEqualToString:@""]
//            && ![self.myLabelSeven.text isEqualToString:@""]
//            && ![self.myLabelEight.text isEqualToString:@""]
//            && ![self.myLabelNine.text isEqualToString:@""]
//        {
//
//
//            }
//
//
//
//
//}


@end
