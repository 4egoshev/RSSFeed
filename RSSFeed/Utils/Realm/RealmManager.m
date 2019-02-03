//
//  RealmManager.m
//  RSSFeed
//
//  Created by Александр Чегошев on 03/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import <Realm/Realm.h>
#import "RealmManager.h"
#import "Source.h"

@implementation RealmManager

#pragma mark - Create default
+ (void)createDefaultSource {
    if ([self isSourceEmpty]) {
        Source *source = [Source new];
        source.sourceId = 1;
        source.name = @"Лента.ру";
        source.urlString = @"https://lenta.ru/rss";
        source.isRead = true;
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            [realm addOrUpdateObject:source];
        }];
        Source *source2 = [Source new];
        source2.sourceId = 2;
        source2.name = @"Яндекс Технологии";
        source2.urlString = @"https://news.yandex.ru/computers.rss";
        source2.isRead = false;
        
        [realm transactionWithBlock:^{
            [realm addOrUpdateObject:source2];
        }];
    }
}

+ (BOOL)isSourceEmpty {
    RLMResults *result = [Source allObjects];
    NSMutableArray *array = [NSMutableArray new];
    for (Source *source in result) {
        [array addObject:source];
    }
    if (array.count == 0) {
        return true;
    } else {
        return false;
    }
}

#pragma mark - Read & Select

+ (void)updateReadFor:(NSInteger)sourceId {
    NSString *predicateString = [NSString stringWithFormat:@"sourceId == %ld",sourceId];
    Source *source = [[Source objectsWhere:predicateString] firstObject];
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    if (source.isRead) {
        source.isRead = false;
    }
    else {
        source.isRead = true;
    }
    [realm commitWriteTransaction];
}

+ (BOOL)updateReadAll:(BOOL)isRead {
    BOOL isReadAll;
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    if (!isRead) {
        [[Source allObjects] setValue:@"true" forKey:@"isRead"];
        isReadAll = true;
    } else {
        [[Source allObjects] setValue:@"false" forKey:@"isRead"];
        isReadAll = false;
    }
    [realm commitWriteTransaction];
    return isReadAll;
}

+ (void)updateSelectFor:(NSInteger)sourceId {
    NSString *predicateString = [NSString stringWithFormat:@"sourceId == %ld",sourceId];
    Source *source = [[Source objectsWhere:predicateString] firstObject];
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    if (source.isSelect) {
        source.isSelect = false;
    }
    else {
        source.isSelect = true;
    }
    [realm commitWriteTransaction];
}

+ (BOOL)updateSelectAll:(BOOL)isSelect {
    BOOL isSelectAll;
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    if (!isSelect) {
        [[Source allObjects] setValue:@"true" forKey:@"isSelect"];
        isSelectAll = true;
    } else {
        [[Source allObjects] setValue:@"false" forKey:@"isSelect"];
        isSelectAll = false;
    }
    [realm commitWriteTransaction];
    return isSelectAll;
}

+ (void)unselectAll {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [[Source allObjects] setValue:@"false" forKey:@"isSelect"];
    [realm commitWriteTransaction];
}

@end
