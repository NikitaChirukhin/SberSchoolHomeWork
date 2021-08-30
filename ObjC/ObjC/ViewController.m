//
//  ViewController.m
//  ObjC
//
//  Created by Никита Чирухин on 23.08.2021.
//

#import "ViewController.h"
#import "NCSorting.h"



@interface ViewController () 

@property(weak, nonatomic) id<SortingDelegate> delegate;
@property(strong, nonatomic) NSMutableArray<NSString *> *str;
@property(strong, nonatomic) NSMutableDictionary<NSString *, NSNumber *> *sortedArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self delegating];
    [self sorting];
}

- (void)delegating {
    NCSorting *sorting = [NCSorting new];
    self.delegate = sorting;
    
    if ([self.delegate respondsToSelector:@selector(delegatedArray)]) {
        self.str = [[self.delegate delegatedArray] mutableCopy];
    }
}

- (void)sorting {
    
    for (NSString *item in self.str) {
        NSInteger counter = 0;
        NSUInteger length = [item length];
        unichar buffer[length];
        [item getCharacters:buffer range:NSMakeRange(0, length)];
        for (NSUInteger i = 0; i < item.length; i++) {
            if (buffer[i] == "N") {
                counter++;
            }
        }
    }
}


@end
