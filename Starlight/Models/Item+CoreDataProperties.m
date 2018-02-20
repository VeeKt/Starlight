//
//  Item+CoreDataProperties.m
//  Starlight
//
//  Created by Victoria on 20.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//
//

#import "Item+CoreDataProperties.h"

@implementation Item (CoreDataProperties)

+ (NSFetchRequest<Item *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Item"];
}

@dynamic image;

@end
