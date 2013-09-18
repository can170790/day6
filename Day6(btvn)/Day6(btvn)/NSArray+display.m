//
//  NSArray+display.m
//  Day6(btvn)
//
//  Created by MAC on 9/15/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "NSArray+display.h"

@implementation NSArray (display)

-(void) display
{
    for(id object in self)
        NSLog(@"%@",object);
}


@end
