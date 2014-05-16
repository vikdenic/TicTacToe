//
//  ViewController.m
//  TicTacToe
//
//  Created by Vik Denic on 5/15/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>
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
@property (assign) BOOL catCheckerVar;

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.testInt = 1;
    self.catCheckerVar = YES;
}


//-(void)findLabelUsingPoint:(CGPoint)tapRecognizer{
//
//}

//helper method
-(BOOL)changePlayerAndLabel:(UILabel *)tappedLabel
{
    self.testInt += 1; //or ++
    if(self.testInt % 2 == 0 && [tappedLabel.text isEqualToString:@""]){
        tappedLabel.text = @"X";
        tappedLabel.textColor = [UIColor blueColor];
        self.whichPlayerLabel.text = @"Player 1";
        return YES;
    }
    else if(self.testInt % 2 != 0 && [tappedLabel.text isEqualToString:@""]){
        tappedLabel.text =@"O";
        self.whichPlayerLabel.text = @"Player 2";
        tappedLabel.textColor = [UIColor redColor];
        return YES;
    }else{
        self.testInt --;
        return NO;

    }
}


-(IBAction)onLabelTapped:(UITapGestureRecognizer *)tapRecognizer{
    CGPoint point;
    point = [tapRecognizer locationInView:self.view];
//    NSLog(@"%@", NSStringFromCGPoint(point) );

    if(CGRectContainsPoint(self.myLabelOne.frame, point)){
        [self changePlayerAndLabel:self.myLabelOne];
    }
    if (CGRectContainsPoint(self.myLabelTwo.frame, point)) {
        [self changePlayerAndLabel:self.myLabelTwo];
    }
    if (CGRectContainsPoint(self.myLabelThree.frame, point)) {
        [self changePlayerAndLabel:self.myLabelThree];
    }
    if (CGRectContainsPoint(self.myLabelFour.frame, point)) {
        [self changePlayerAndLabel:self.myLabelFour];
    }
    if (CGRectContainsPoint(self.myLabelFive.frame, point)) {
        [self changePlayerAndLabel:self.myLabelFive];
    }
    if (CGRectContainsPoint(self.myLabelSix.frame, point)) {
        [self changePlayerAndLabel:self.myLabelSix];
    }
    if (CGRectContainsPoint(self.myLabelSeven.frame, point)) {
        [self changePlayerAndLabel:self.myLabelSeven];
    }
    if (CGRectContainsPoint(self.myLabelEight.frame, point)) {
        [self changePlayerAndLabel:self.myLabelEight];
    }
    if (CGRectContainsPoint(self.myLabelNine.frame, point)) {
        [self changePlayerAndLabel:self.myLabelNine];
    }

    [self whoWon:self.myLabelTwo :self.myLabelFive :self.myLabelEight];
    [self whoWon:self.myLabelThree :self.myLabelSix :self.myLabelNine];
    [self whoWon:self.myLabelOne :self.myLabelFour :self.myLabelSeven];
    [self whoWon:self.myLabelOne :self.myLabelTwo :self.myLabelThree];
    [self whoWon:self.myLabelFour :self.myLabelFive :self.myLabelSix];
    [self whoWon:self.myLabelSeven :self.myLabelEight :self.myLabelNine];
    [self whoWon:self.myLabelOne :self.myLabelFive :self.myLabelNine];
    [self whoWon:self.myLabelSeven :self.myLabelFive :self.myLabelThree];
    [self checkForCat];
    NSLog(@"%i", self.testInt);

}

//already tapped method to be called in onLableTapped.
//whenever a labels text is !@"" you cannot click it.


//create an alert that displays one of two variable: player 1 or player 2
//based on if there is a trio of x's or o's
//the dismiss of the alert should reset the game

-(BOOL)whoWon:(UILabel *)testLabel1 : (UILabel *)testLabel2 : (UILabel *)testLabel3
{

    if ([testLabel1.text isEqual: @"X" ] && [testLabel2.text isEqual: @"X"] && [testLabel3.text isEqual: @"X" ] )
    {
        UIAlertView *xWon = [[UIAlertView alloc]initWithTitle:@"We have a winner!" message:@"X Win" delegate:self cancelButtonTitle:@"Play Again!" otherButtonTitles:nil, nil];
        [xWon show];
        //CATSGAME NOT TRUE
        self.catCheckerVar = NO;

    }

    else if ([testLabel1.text isEqual: @"O" ] && [testLabel2.text isEqual: @"O"] && [testLabel3.text isEqual: @"O" ] )
    {
        UIAlertView *oWon = [[UIAlertView alloc]initWithTitle:@"We have a winner!" message:@"O Win" delegate:self cancelButtonTitle:@"Play Again!" otherButtonTitles:nil, nil];
        [oWon show];
        //CATSGAME NOT TRUE
        self.catCheckerVar = NO;
    }

    return YES;
}

//cats game method
////checking if each space isn't empty
-(BOOL)checkForCat{

        if (![self.myLabelOne.text isEqualToString:@""]
            && ![self.myLabelTwo.text isEqualToString:@""]
            && ![self.myLabelThree.text isEqualToString:@""]
            && ![self.myLabelFour.text isEqualToString:@""]
            && ![self.myLabelFive.text isEqualToString:@""]
            && ![self.myLabelSix.text isEqualToString:@""]
            && ![self.myLabelSeven.text isEqualToString:@""]
            && ![self.myLabelEight.text isEqualToString:@""]
            && ![self.myLabelNine.text isEqualToString:@""]
            && self.catCheckerVar == YES)
        {
            UIAlertView *catsGame = [[UIAlertView alloc]initWithTitle:@"No Winner" message:@"Cat's Game" delegate:self cancelButtonTitle:@"Play Again!" otherButtonTitles:nil, nil];
            [catsGame show];
            return YES;
                  }

        return NO;
}

//helper method that uses alert view delegate
//takes in two string parameters one for title one for message
//1 set the alert.message to whatever string parameter is passed in
//have the button reset all labels to @""

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        self.myLabelOne.text = @"";
        self.myLabelTwo.text = @"";
        self.myLabelThree.text = @"";
        self.myLabelFour.text = @"";
        self.myLabelFive.text = @"";
        self.myLabelSix.text = @"";
        self.myLabelSeven.text = @"";
        self.myLabelEight.text = @"";
        self.myLabelNine.text = @"";
        self.whichPlayerLabel.text = @"Player 1 Begin!";
        self.testInt = 1;
    }
}

@end
