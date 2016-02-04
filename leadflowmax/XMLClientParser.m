//
//  XMLClientParser.m
//  leadflowmax
//
//  Created by Richard Stobart on 01/02/2016.
//  Copyright © 2016 Unboxed Consulting. All rights reserved.
//

#import "XMLClientParser.h"

@implementation XMLClientParser
@synthesize clients = _clients;

NSMutableString	*currentNodeContent;
NSXMLParser		*parser;
WFMClient		*currentClient;
bool            isClient;

-(id) loadXMLByURL:(NSString *)urlString
{
    _clients		= [[NSMutableArray alloc] init];
    NSURL *url		= [NSURL URLWithString:urlString];
    NSData	*data   = [[NSData alloc] initWithContentsOfURL:url];
    parser			= [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
    parser.shouldProcessNamespaces = YES;
    parser.shouldReportNamespacePrefixes = YES;
    [parser parse];
    return self;
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    currentNodeContent = (NSMutableString *) [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementname isEqualToString:@"Client"])
    {
        currentClient = [WFMClient alloc];
        isClient = YES;
        //isContact = NO;
    }
    if ([elementname isEqualToString:@"AccountManager"])
    {
        isClient = NO;
    }
    if ([elementname isEqualToString:@"JobManager"])
    {
        isClient = NO;
    }
    if ([elementname isEqualToString:@"Contact"])
    {
        //isContact = YES;
        //currentContact = [WFMContact alloc];
        
        isClient = NO;
    }
}


- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if (isClient)
    {
        if ([elementname isEqualToString:@"ID"])
        {
            currentClient.WFMid = currentNodeContent;
        }
        if ([elementname isEqualToString:@"Name"])
        {
            currentClient.name = currentNodeContent;
        }
    }
    //if ([elementname isEqualToString:@"AccountManager"]){
    //    isClient = YES;
    //}
    if ([elementname isEqualToString:@"Client"])
    {
        [self.clients addObject:currentClient];
        currentClient = nil;
        currentNodeContent = nil;
        isClient = NO;
    }
    //if (isContact)...
}

@end
