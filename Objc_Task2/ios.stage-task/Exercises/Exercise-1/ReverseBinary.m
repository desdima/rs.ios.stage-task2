#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    
    NSNumber* decNum = @(n);
    long dec = [decNum integerValue];
    
    NSString *binStr = @"";
     
    while (dec > 0) {
        NSString *ostatok = [NSString stringWithFormat: @"%lu", dec % 2];
        binStr = [binStr stringByAppendingString:ostatok];
        dec = dec / 2;
    }
    long t = [binStr length];
    NSString *zero = @"0";
    
    for (int i = 0; i < 8 - t; i++) {
        //[binStr1 insertString:zero atIndex:0];
        binStr = [binStr stringByAppendingString:zero];
    }
    
    int binToDec = 0;
    for (int i = 0; i < 8; i++) {
        unichar index = [binStr characterAtIndex:i];
        NSString *string = [[NSString alloc] initWithCharacters:&index length:1];
        long t = [string integerValue];
        int powInd = pow(2, 7 - i);
        binToDec += t * powInd;
    }
    
    return binToDec;
}
