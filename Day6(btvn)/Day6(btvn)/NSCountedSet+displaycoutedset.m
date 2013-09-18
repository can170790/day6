//
//  NSCountedSet+displaycoutedset.m
//  Day6(btvn)
//
//  Created by MAC on 9/15/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "NSCountedSet+displaycoutedset.h"

@implementation NSCountedSet (displaycoutedset)
-(void) displaycountedset
{
    for (id object in self)
    {
        NSLog(@"%@-%d",object,[self countForObject:object]);
    }
}

@end
