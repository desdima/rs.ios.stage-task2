//
//  TwoDimensionalSortTests.m
//  ios.stage-task1Tests
//
//  Created by Eduard Ivash on 26.04.21.
//

#import <XCTest/XCTest.h>
#import "TwoDimensionalArraySorter.h"

@interface TwoDimensionalSortTests : XCTestCase

@property (nonatomic, strong) TwoDimensionalArraySorter *sorter;

@end

@implementation TwoDimensionalSortTests

- (void)setUp {
    self.sorter = [TwoDimensionalArraySorter new];
}

- (void)tearDown {
    self.sorter = nil;
}

- (void)test1 {
    NSArray *inputArray = nil;
    NSArray *resultArray = @[];
    BOOL flag = [[self.sorter twoDimensionalSort: inputArray] isEqualToArray: resultArray];
    XCTAssertTrue(flag);
}

- (void)test2 {
    NSArray *inputArray = @[@[@3,@2,@1],@[@4,@6,@5],@[@9,@7,@8]];
    NSArray *resultArray = @[@1,@2,@3,@4,@5,@6,@7,@8,@9];
    BOOL flag = [[self.sorter twoDimensionalSort: inputArray] isEqualToArray:resultArray];
    XCTAssertTrue(flag);
}

- (void)test3 {
    NSArray *inputArray = @[@[@"Ivan",@"Ben",@"Dmitrii"], @[@"Billy",@"Cris"], @[@"Valentin",@"Van"], @[@"Alex",@"Kony"]];
    NSArray *restultArray = @[@"Alex",@"Ben",@"Billy",@"Cris",@"Dmitrii",@"Ivan",@"Kony",@"Valentin",@"Van"];
    BOOL flag = [[self.sorter twoDimensionalSort: inputArray] isEqualToArray: restultArray];
    XCTAssertTrue(flag);
}

- (void)test4 {
    NSArray *inputArray = @[@4,@"Vanya",@3,@4,@"Alex",@8,@"Tim",@9];
    NSArray *resultArray = [self.sorter twoDimensionalSort: inputArray];
    XCTAssertEqualObjects(resultArray, @[]);
}
- (void)test5 {
    NSArray *inputArray = @[@[@4, @6, @2], @[@1, @5, @3], @[@"Ben", @"Alex", @"Cris"], @[@"Desmond", @"Evan"], @[@8, @2, @7, @9]];
    NSArray *restultArray = @[@[@1, @2, @3, @4, @5, @6, @7, @8, @9], @[@"Evan", @"Desmond", @"Cris", @"Ben", @"Alex"]];
    BOOL flag = [[self.sorter twoDimensionalSort: inputArray] isEqualToArray: restultArray];
    XCTAssertTrue(flag);
}

@end
