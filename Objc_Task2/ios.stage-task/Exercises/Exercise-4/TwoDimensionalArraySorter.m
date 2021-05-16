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
            
            }}
        else {
            return @[];
            }
    }
    
    NSMutableArray *unionArrayInt3 = [[NSMutableArray alloc] init];
    NSMutableArray *unionArrayStr3 = [[NSMutableArray alloc] init];
    
    
    int j = 1;
    if (newUnionArrayInt.count != 0) {
        [newUnionArrayInt sortUsingSelector:@selector(compare:)];
        [unionArrayInt3 insertObject:newUnionArrayInt[0] atIndex:0];
        j = 1;
        for (int i = 1; i < newUnionArrayInt.count; i++) {
            if (newUnionArrayInt[i - 1] != newUnionArrayInt[i]) {
                [unionArrayInt3 insertObject:newUnionArrayInt[i] atIndex:j];
                j++;
            }
        }
        newUnionArrayInt = unionArrayInt3;
        
    }
    
    if (newUnionArrayStr.count != 0) {
        [newUnionArrayStr sortUsingSelector:@selector(compare:)];
        [unionArrayStr3 insertObject:newUnionArrayStr[0] atIndex:0];
        j = 1;
        for (int i = 1; i < newUnionArrayStr.count; i++) {
            if (newUnionArrayStr[i - 1] != newUnionArrayStr[i]) {
                [unionArrayStr3 insertObject:newUnionArrayStr[i] atIndex:j];
                j++;
            }
        }
        newUnionArrayStr = unionArrayStr3;
    }
    
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
