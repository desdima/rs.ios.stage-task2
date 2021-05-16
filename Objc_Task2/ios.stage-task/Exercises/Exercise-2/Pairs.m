#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    
    if (array.count == 0) return 0;
    
    long pairNum = [number integerValue];
    int countPairs = 0;
    
    
    
    NSMutableArray *sortArray = [array mutableCopy];
    [sortArray sortUsingSelector:@selector(compare:)];
    
    for (int i = 0; i < sortArray.count; i++) {
        long i_num = [sortArray[i] integerValue];
        for (int j = i + 1; j < sortArray.count; j++) {
            if (i_num == [sortArray[j] integerValue] + pairNum) countPairs++;
        }
    }
    
    return countPairs;
}

@end
