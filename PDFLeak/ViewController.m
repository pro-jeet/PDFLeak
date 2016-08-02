//
//  ViewController.m
//  PDFLeak
//
//  Created by Sharma Jitesh on 13/07/16.
//  Copyright © 2016 Sharma Jitesh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)generatePDF:(id)sender
{
    NSString *pdfname = [NSString stringWithFormat:@"%@.pdf",[self getCurrentDateTime]];
    NSString* pdfPath = [NSTemporaryDirectory() stringByAppendingPathComponent:pdfname];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[self.view layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    BOOL contextCreated =  UIGraphicsBeginPDFContextToFile(pdfPath, CGRectZero, nil); // default page size
    if (contextCreated)
    {
        UIGraphicsBeginPDFPageWithInfo(CGRectZero, nil);
        [screenshot drawAtPoint:CGPointZero];
        // Ending the context will automatically save the PDF file to the filename
        UIGraphicsEndPDFContext();
    }
}

-(NSString*)getCurrentDateTime
{
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy_HH.mm.ss"];
    return [dateFormatter stringFromDate:date];
}

@end
