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

NSInteger getNumInput(NSString *num) {
  NSString *optionsList = @"\nChoose one of the following options:\n1. Uppercase \n2. Lowercase \n3. Numberize \n4. Canadianize \n5. Respond \n6. De-Space-It \n7. Word Count \n8. Remove Punctuations \n9. Done";
  
  while (true) {
    NSLog(@"%@",optionsList);
    
    char inputChars[255];
    fgets(inputChars, 255, stdin);
    
    NSString *numInput = [NSString stringWithUTF8String:inputChars];
    NSInteger intNumInput = [numInput integerValue];
    
    if (intNumInput >= 1 && intNumInput <= 9) {
      return intNumInput;
    } else {
      NSLog(@"Please type from 1 to 9.");
    }
  }
}

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSString *input = getUserInput(@"\nEnter your String: ('q' to quit)");
  
    if (![input isEqualToString:@"q"]) {
      NSMutableString *s = [NSMutableString stringWithString:input];
      
      BOOL loopList = YES;
      while (loopList) {
        NSInteger choiceInput = getNumInput(@"");
        
        // different options
        switch (choiceInput) {
          case 1:
            // Uppercase
            NSLog(@"%@", [s uppercaseString]);
            break;
          case 2:
            // Lowercase
            NSLog(@"%@", [s lowercaseString]);
            break;
          case 3:
            // Numberize; if can not do it -> Input Cannot Be Converted to Integer.
            if ((NSInteger *)[s integerValue]) {
              NSLog(@"%ld", (long)[s integerValue]);
            } else {
              NSLog(@"Input Cannot Be Converted to Integer.");
            }
            break;
          case 4:
            // Canadianize + ,eh?
            [s appendString:@", eh?"];
            NSLog(@"%@", s);
            break;
          case 5:
            // Respond, if end with ? -> "I don't know". if end with ! -> "Whoa, calm down!".
          {
            NSString *lastChar = [s substringFromIndex: s.length - 1];
            if ([lastChar isEqualToString:@"?"]) {
              NSLog(@"I don't know.");
            } else if ([s isEqualToString:@"!"]) {
              NSLog(@"Whoa, calm down!");
            } 
            break;
          }
          case 6:
            // De-Space-It: Replace all spaces with "-".
          {
            NSString *replaceSpaces = [s stringByReplacingOccurrencesOfString:@" " withString:@"-"];
            NSLog(@"%@", replaceSpaces);
            break;
          }
          case 7:
            // Word Count
            NSLog(@"%lu", (unsigned long)[[s componentsSeparatedByString: @" "] count]);
            break;
          case 8:
            // Remove Punctuations
          {
            NSCharacterSet *characterSet = [NSCharacterSet punctuationCharacterSet];
            NSString *removePun = [[s componentsSeparatedByCharactersInSet:characterSet] componentsJoinedByString: @""];
            
            NSLog(@"%@", removePun);
            break;
          }
          case 9:
            loopList = NO;
            break;
        }
       }
     }
   }
  return 0;
}
