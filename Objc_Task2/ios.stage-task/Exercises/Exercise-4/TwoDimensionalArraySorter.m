#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    if ((array == nil) || (array.count == 0)) return @[];
    NSMutableArray *unionArray;
    NSMutableArray *unionArrayInt = [[NSMutableArray alloc] init];
    NSMutableArray *unionArrayStr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < array.count; i++) {
        if ([array[i] isKindOfClass:[NSArray class]]) {
            if ([array[i][1] isKindOfClass:[NSNumber class]]) {
                unionArray = unionArrayInt;
            }
            else {
                unionArray = unionArrayStr;
            }
            for (int j = 0; j < array[i].count; j++) {
                [unionArray insertObject:array[i][j] atIndex:unionArray.count];
            }
        }
        else {
            //оформить отдельным методом
                int numCount = 0;
                int numStr = 0;
                for (int i = 0; i < array.count; i++) {
                    if ([array[i] isKindOfClass:[NSNumber class]]) {
                        numCount++;
                    }
                    if ([array[i] isKindOfClass:[NSString class]]) {
                        numStr++;
                    }
                }
                if ((numCount != 0) && (numStr != 0)) return @[];
                
                unionArray = [array mutableCopy];
            }
    }
    [unionArray sortUsingSelector:@selector(compare:)];    
    
    NSMutableArray *unionArray3 = [[NSMutableArray alloc] init];;
    NSMutableArray *unionArrayInt3 = [[NSMutableArray alloc] init];
    NSMutableArray *unionArrayStr3 = [[NSMutableArray alloc] init];
    
    
    
    [unionArray3 insertObject:unionArray[0] atIndex:0];
    int j = 1;
    for (int i = 1; i < unionArray.count; i++) {
        if (unionArray[i - 1] != unionArray[i]) {
            [unionArray3 insertObject:unionArray[i] atIndex:j];
            j++;
        }
    }
    unionArray = unionArray3;
    
    if (unionArrayInt.count != 0) {
        [unionArrayInt sortUsingSelector:@selector(compare:)];
        [unionArrayInt3 insertObject:unionArrayInt[0] atIndex:0];
        j = 1;
        for (int i = 1; i < unionArrayInt.count; i++) {
            if (unionArrayInt[i - 1] != unionArrayInt[i]) {
                [unionArrayInt3 insertObject:unionArrayInt[i] atIndex:j];
                j++;
            }
        }
        unionArrayInt = unionArrayInt3;
        
    }
    
    if (unionArrayStr.count != 0) {
        [unionArrayStr sortUsingSelector:@selector(compare:)];
        [unionArrayStr3 insertObject:unionArrayStr[0] atIndex:0];
        j = 1;
        for (int i = 1; i < unionArrayStr.count; i++) {
            if (unionArrayStr[i - 1] != unionArrayStr[i]) {
                [unionArrayStr3 insertObject:unionArrayStr[i] atIndex:j];
                j++;
            }
        }
        unionArrayStr = unionArrayStr3;
    }
    
    NSMutableArray *unionArrayInt2 = [[NSMutableArray alloc] init];
    
    if ((unionArrayInt.count != 0) && (unionArrayStr.count != 0)) {
        [unionArrayInt2 insertObject:unionArrayInt atIndex:0];
        
        NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"self" ascending:NO];
        NSArray *descriptors = [NSArray arrayWithObject: descriptor];
        NSArray *reverseOrder = [unionArrayStr sortedArrayUsingDescriptors:descriptors];
        
        [unionArrayInt2 insertObject:reverseOrder atIndex:1];
        
        return unionArrayInt2;
        
    }

    return unionArray;
}

@end
