//
//  ToDo.h
//  LHL-June.EveryDo
//
//  Created by Asuka Nakagawa on 2016-07-12.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *todoDescription;


// Number low(1-3)high
@property (nonatomic) int priorityNumber;
@property BOOL isCompleted;

- (instancetype)initWithTitle:(NSString *)title todoDescription:(NSString *)todoDescription priorityNumber:(int)priorityNumber isCompleted:(BOOL)isCompleted;



@end
