//
//  Item+CoreDataProperties.h
//  Starlight
//
//  Created by Victoria on 12.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//
//

#import "Item+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Item (CoreDataProperties)

+ (NSFetchRequest<Item *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSDate *date;
@property (nullable, nonatomic, retain) NSData *image;
@property (nullable, nonatomic, copy) NSString *nete;
@property (nullable, nonatomic, copy) NSString *qty;

@end

NS_ASSUME_NONNULL_END
