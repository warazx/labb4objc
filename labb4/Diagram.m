//
//  Diagram.m
//  labb4
//
//  Created by Christian Karlsson on 2017-02-05.
//  Copyright © 2017 Christian Karlsson. All rights reserved.
//

#import "Diagram.h"

@implementation Diagram

- (void)drawRect:(CGRect)rect {
    
    NSArray *months = @[@{@"name": @"january",
                          @"value": @100},
                        @{@"name": @"february",
                          @"value": @80},
                        @{@"name": @"mars",
                          @"value": @130},
                        @{@"name": @"april",
                          @"value": @160}];
    
    float numberOfStaplar = months.count;
    float maxHightStaplar = 0;
    for(NSDictionary *dict in months) {
        float thisHight = [[dict valueForKey:@"value"] floatValue];
        if(thisHight > maxHightStaplar) maxHightStaplar = thisHight;
    }
    
    
    int currentStapel = 0;
    for(float x = 0.0f; x < rect.size.width; x+= rect.size.width / numberOfStaplar) {
        
        NSDictionary *currentMonth = [months objectAtIndex:currentStapel];
        float hight = ([[currentMonth objectForKey:@"value"] floatValue]) /maxHightStaplar * rect.size.height;
        NSString *string = [currentMonth objectForKey:@"name"];
        
        //Texten hamnar bakom staplarna, har inte hitat någon lösning för detta.
        [string drawInRect:CGRectMake(x, 10, rect.size.width / numberOfStaplar, 15) withAttributes:nil];
        
        UIBezierPath *stapel =
        [UIBezierPath bezierPathWithRect:
         CGRectMake(x,
                    rect.size.height,
                    rect.size.width / numberOfStaplar,
                    -hight )];
        
        if( currentStapel%2 == 1) {
            [[UIColor blueColor] setFill];
        } else {
            [[UIColor redColor] setFill];
        }
        currentStapel++;
        
        [stapel fill];
    }
}

@end
