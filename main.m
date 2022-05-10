//
//  main.m
//  Lab1
//
//  Created by Esperanza on 2022-05-10.
//

#import <Foundation/Foundation.h>
NSString *getUserInput(NSString *prompt) {
  char inputChars[255];
  
  NSLog(@"%@", prompt);
  fgets(inputChars, 255, stdin);
  NSString *str = [NSString stringWithUTF8String:inputChars];
  return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSString *input = getUserInput(@"\nEnter your String: ('q' to quit)");
  
    NSString *optionsList = @"\nChoose one of the following options:\n1. Uppercase \n2. Lowercase \n3. Numberize \n4. Canadianize \n5. Respond \n6. De-Space-It \n7. Word Count \n8. Remove Punctuations \n9. Done";
    
    if (![input isEqualToString:@"q"]) {
      NSLog(@"%@", optionsList);
      NSString *numInput = getUserInput(@"\n");
      if ([numInput isEqualToString:@"1"]) {
        NSLog(@"%@", [input uppercaseString]);
      } else if ([numInput isEqualToString:@"2"]) {
        NSLog(@"%@", [input lowercaseString]);
      } else if ([numInput isEqualToString:@"3"]) {
        if ([input intValue]){
          NSLog(@"%d", [input intValue]);
        } else {
          NSLog(@"Input Cannot Be Converted to Integer.");
        }
      } else if ([numInput isEqualToString:@"4"]) {
        NSMutableString *s = [NSMutableString stringWithString:input];
        [s appendString:@", eh?"];
        NSLog(@"%@", s);
      } else if ([numInput isEqualToString:@"5"]) {
        NSString *respond = [input substringFromIndex: [input length] - 1];
        if ([respond isEqualToString:@"?"]) {
          NSLog(@"I don't know.");
        } else if ([respond isEqualToString:@"!"]) {
          NSLog(@"Whoa, calm down!");
        }
      } else if ([numInput isEqualToString:@"6"]) {
        NSString *replaceString = [input stringByReplacingOccurrencesOfString:@" " withString:@"-"];
        NSLog(@"%@", replaceString);
      }
    
    }
  }
  return 0;
}
