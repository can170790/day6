//
//  ViewController.m
//  Day6(btvn)
//
//  Created by MAC on 9/15/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+display.h"
#import "NSCountedSet+displaycoutedset.h"

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
#pragma load data from plist
- (IBAction)Loaddatafromplist:(id)sender {
    NSString *dataputin = [[NSBundle mainBundle] pathForResource:@"putin" ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:dataputin encoding:NSUTF8StringEncoding error:nil];
    content = [content stringByReplacingOccurrencesOfString:@"." withString:@""];
    content = [content stringByReplacingOccurrencesOfString:@"," withString:@""];
    content = [content stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    content = [content stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
    content = [content stringByReplacingOccurrencesOfString:@"-" withString:@" "];
    [content lowercaseString];
    //NSLog(@"%@",content);
#pragma gan tu chuoi vao mang va su ly khoang trang
    NSArray *array1 = [content componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    //[array1 display];
    NSMutableArray *mutabarray1 = [NSMutableArray array];
    for (NSString *comp in array1)
    {
        if ([comp length] > 1)
        {
            [mutabarray1 addObject:comp];
        }
    }
    
#pragma dem so tu
    NSCountedSet *counted1 = [[NSCountedSet alloc] initWithArray:mutabarray1];
    //[counted1 displaycountedset];
    
#pragma xap xep anphabel(a,b,c)
    NSArray *array2 = [mutabarray1 sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    //[array2 display];
#pragma sap xep so luong ky tu
    NSLog(@"\n--------------sap xep do dai-------------------\n");
    static int currentLength = 1;
    static int lengthNumberOfArrayOneObject = 0;
    
    
    NSMutableArray *mutablearray2 =[[NSMutableArray alloc] init];
    for (id object in mutabarray1)
    {
        for (id object1 in mutabarray1)
        {
            if ([object1 length] == currentLength)
            {
                [mutablearray2 addObject:object1];
                lengthNumberOfArrayOneObject++;
            } else
            {
                continue;
            }
        }
        
        currentLength++;
    }
    [mutablearray2 display];
#pragma xap xep theo countedset
    NSLog(@"------------sap xep theo countedset-------------");
    NSMutableArray *mucount = [NSMutableArray array];
   
    for (id object in counted1)
    {
        NSDictionary *dict = @{@"string":object,@"count":@([counted1 countForObject:object])};
        [mucount addObject:dict];
    }
    [mucount display];
    
    NSArray *final = [mucount sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"count" ascending:YES ]]];
    [final display];
}
@end
