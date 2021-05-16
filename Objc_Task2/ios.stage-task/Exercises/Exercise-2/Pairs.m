#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    
    long pairNum = [number integerValue];
    int countPairs = 0;
    for (int i = 0; i < array.count; i++) {
        long i_num = [array[i] integerValue];
        for (int j = 0; j < array.count; j++) {
            if (i_num == [array[j] integerValue] + pairNum) countPairs++;
        }
    }
    
    return countPairs;
}

@end
