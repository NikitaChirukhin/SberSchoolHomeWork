//
//  NCSorting.h
//  ObjC
//
//  Created by Никита Чирухин on 23.08.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SortingDelegate <NSObject>

- (NSArray<NSString *> *)delegatedArray;

@end


@interface NCSorting : NSObject <SortingDelegate>

@end

NS_ASSUME_NONNULL_END
