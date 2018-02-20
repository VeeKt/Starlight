//
//  VYKAppLibraryController.m
//  Starlight
//
//  Created by Victoria on 11.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "VYKAppLibraryController.h"
#import "Item+CoreDataClass.h"
#import "AppDelegate.h"

@interface VYKAppLibraryController () <NSFetchedResultsControllerDelegate>

@property (nonatomic,strong) NSArray *itemsArray;
@property (nonatomic, strong) NSManagedObjectContext *coreDataContext;
@property NSUInteger rowNo;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation VYKAppLibraryController

- (BOOL)isSucsessfulRequest:(VYKMainViewController *)appLibraryController {
    [self loadModel];
    if (self.itemsArray.count == 0){
        return NO;
    }
    return YES;
}


#pragma mark - workWithModel

- (void)loadModel {
    self.itemsArray = nil;
    self.itemsArray = [self.coreDataContext executeFetchRequest:[Item fetchRequest] error:nil];
}

- (NSManagedObjectContext *)coreDataContext {
    if (_coreDataContext) {
        return _coreDataContext;
    }
    
    UIApplication *application = [UIApplication sharedApplication];
    NSPersistentContainer *container = ((AppDelegate *)(application.delegate)).
    persistentContainer;
    NSManagedObjectContext *context = container.viewContext;
    
    return context;
}

#pragma mark - fetchRequest

- (NSFetchRequest *)getFetchRequest {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"The item"];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
    fetchRequest.sortDescriptors = @[sortDescriptor];
    return fetchRequest;
}

@end
