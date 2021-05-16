#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    if ((numbersArray == nil) || (numbersArray.count == 0)) return @"";
    
    NSString *ipadr = @"";
    
    for (int i = 0; i < 4; i++) {
        if (i < numbersArray.count) {
            NSString *octet = [numbersArray[i] stringValue];
            if ([octet integerValue] > 255) return @"The numbers in the input array can be in the range from 0 to 255.";
            if ([octet integerValue] < 0) return @"Negative numbers are not valid for input.";
            ipadr = [ipadr stringByAppendingString:octet];
            ipadr = [ipadr stringByAppendingString:@"."];
        }
        else {
            ipadr = [ipadr stringByAppendingString:@"0."];
        }
    }
    ipadr = [ipadr substringToIndex:[ipadr length] - 1];
    return ipadr;
}

@end
