//
//  WFMClient.h
//  leadflowmax
//
//  Created by Richard Stobart on 01/02/2016.
//  Copyright © 2016 Unboxed Consulting. All rights reserved.
//

#ifndef WFMClient_h
#define WFMClient_h

@interface WFMClient: NSObject

@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)NSString *WFMid;
@property (weak) IBOutlet NSArray *contacts;

@end

#endif /* WFMClient_h */
