#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    
    if (array.count == 0) return 0;
    
    long pairNum = [number integerValue];
    int countPairs = 0;
    
    
    
    NSMutableArray *sortArray = [array mutableCopy];
    [sortArray sortUsingSelector:@selector(compare:)];
    /*
    NSMutableArray *sortArrayWithoutDoubles = [[NSMutableArray alloc] init];
    [sortArrayWithoutDoubles insertObject:sortArray[0] atIndex:0];
    
    int j = 1;
    for (int i = 1; i < sortArray.count; i++) {
        if (sortArray[i - 1] != sortArray[i]) {
            [sortArrayWithoutDoubles insertObject:sortArray[i] atIndex:j];
            j++;
        }
    }*/
    
    for (int i = 0; i < sortArray.count; i++) {
        long i_num = [sortArray[i] integerValue];
        for (int j = i + 1; j < sortArray.count; j++) {
            if (i_num == [sortArray[j] integerValue] + pairNum) countPairs++;
        }
    }
    
    return countPairs;
}

@end
