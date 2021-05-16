#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    
    long pairNum = [number integerValue];
    int countPairs = 0;
    
    NSMutableArray *sortArray = [array mutableCopy];
    [sortArray sortUsingSelector:@selector(compare:)];
    
    NSMutableArray *sortArrayWithoutDoubles = [[NSMutableArray alloc] init];
    [sortArrayWithoutDoubles insertObject:sortArray[0] atIndex:0];
    
    int j = 1;
    for (int i = 1; i < sortArray.count; i++) {
        if (sortArray[i - 1] != sortArray[i]) {
            [sortArrayWithoutDoubles insertObject:sortArray[i] atIndex:j];
            j++;
        }
    }
    
    for (int i = 0; i < sortArrayWithoutDoubles.count; i++) {
        long i_num = [sortArrayWithoutDoubles[i] integerValue];
        for (int j = 0; j < sortArrayWithoutDoubles.count; j++) {
            if (i_num == [sortArrayWithoutDoubles[j] integerValue] + pairNum) countPairs++;
        }
    }
    
    return countPairs;
}

@end
