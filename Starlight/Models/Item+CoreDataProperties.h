//
//  Item+CoreDataProperties.h
//  Starlight
//
//  Created by Victoria on 20.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//
//

#import "Item+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Item (CoreDataProperties)

+ (NSFetchRequest<Item *> *)fetchRequest;

@property (nullable, nonatomic, retain) NSData *image;

@end

NS_ASSUME_NONNULL_END
