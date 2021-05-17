#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    if ((array == nil) || (array.count == 0)) return @[];
    NSMutableArray *newUnionArrayInt = [NSMutableArray new];
    NSMutableArray *newUnionArrayStr = [NSMutableArray new];
    
    for (int i = 0; i < array.count; i++) {
        if ([array[i] isKindOfClass:[NSArray class]]) {
            if (array[i].count != 0) {
                if ([array[i][0] isKindOfClass:[NSNumber class]]) {
                    for (int j = 0; j < array[i].count; j++) {
                        [newUnionArrayInt insertObject:array[i][j] atIndex:newUnionArrayInt.count];
                    }
                }
                else {
                    for (int j = 0; j < array[i].count; j++) {
                        [newUnionArrayStr insertObject:array[i][j] atIndex:newUnionArrayStr.count];
                    }
                }
            }
        }
        else {
            return @[];
            }
    }
    
    if (newUnionArrayInt.count > 1) [newUnionArrayInt sortUsingSelector:@selector(compare:)];
    if (newUnionArrayStr.count > 1) [newUnionArrayStr sortUsingSelector:@selector(compare:)];
    
    NSMutableArray *unionArrayInt2 = [[NSMutableArray alloc] init];
    
    if ((newUnionArrayInt.count != 0) && (newUnionArrayStr.count == 0)) return newUnionArrayInt;
    if ((newUnionArrayInt.count == 0) && (newUnionArrayStr.count != 0)) return newUnionArrayStr;
    
    
    if ((newUnionArrayInt.count != 0) && (newUnionArrayStr.count != 0)) {
        [unionArrayInt2 insertObject:newUnionArrayInt atIndex:0];
        
        NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"self" ascending:NO];
        NSArray *descriptors = [NSArray arrayWithObject: descriptor];
        NSArray *reverseOrder = [newUnionArrayStr sortedArrayUsingDescriptors:descriptors];
        
        [unionArrayInt2 insertObject:reverseOrder atIndex:1];
        
        return unionArrayInt2;
        
    }

    return @[];
}

@end
