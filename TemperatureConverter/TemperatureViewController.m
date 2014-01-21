//
//  TemperatureViewController.m
//  TemperatureConverter
//
//  Created by Chix on 1/16/14.
//  Copyright (c) 2014 Bhagyashree. All rights reserved.
//

#import "TemperatureViewController.h"
#import "ConversionHelper.h"

@interface TemperatureViewController ()
@property (weak, nonatomic) IBOutlet UITextField *fahrenheitTextfield;
@property (weak, nonatomic) IBOutlet UITextField *celsiusTextfield;

@end

@implementation TemperatureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //Assign self as delegating view and text fields as delegates.
    self.fahrenheitTextfield.keyboardType = UIKeyboardTypeNumberPad;
    self.celsiusTextfield.keyboardType = UIKeyboardTypeNumberPad;
    self.fahrenheitTextfield.delegate = self;
    self.celsiusTextfield.delegate = self;
    self.celsiusTextfield.text = @"0";
    NSString* fahrenheitString = [NSString stringWithFormat:@"%0.4f", [ConversionHelper convertCelsiusToFahrenheit:[self.celsiusTextfield.text floatValue]]];
    self.fahrenheitTextfield.text = [ConversionHelper truncateTrailingZeros:fahrenheitString];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSString* currentText = [textField.text stringByReplacingCharactersInRange:range withString:string];

    if(textField == self.fahrenheitTextfield){
        if([currentText isEqualToString:@""]){
            self.celsiusTextfield.text = @"";
        } else {
            float fahrenheit = [currentText floatValue];
            float celsius = [ConversionHelper convertFahrenHeitToCelsius:fahrenheit];
            NSString* celsiusString = [NSString stringWithFormat:@"%0.4f", celsius];
            self.celsiusTextfield.text = [ConversionHelper truncateTrailingZeros:celsiusString];
        }
    }
    else if(textField == self.celsiusTextfield){
        if([currentText isEqualToString:@""]){
            self.fahrenheitTextfield.text = @"";
        } else {
            float celsius = [currentText floatValue];
            float fahrenheit = [ConversionHelper convertCelsiusToFahrenheit:celsius];
            NSString* fahrenheitString = [NSString stringWithFormat:@"%0.4f", fahrenheit];
            self.fahrenheitTextfield.text = [ConversionHelper truncateTrailingZeros:fahrenheitString];
        }
    }
    return YES;
}


@end
