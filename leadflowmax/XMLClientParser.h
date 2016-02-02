//
//  XMLClientParser.h
//  leadflowmax
//
//  Created by Richard Stobart on 01/02/2016.
//  Copyright © 2016 Unboxed Consulting. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WFMClient.h"

@interface XMLClientParser : NSObject <NSXMLParserDelegate>

@property (strong, readonly) NSMutableArray *clients;

-(id) loadXMLByURL:(NSString *)urlString;

@end
