//
//  RealmManager.m
//  RSSFeed
//
//  Created by Александр Чегошев on 03/02/2019.
//  Copyright © 2019 Александр Чегошев. All rights reserved.
//

#import <Realm/Realm.h>
#import "RealmManager.h"
#import "Utils.h"
#import "Source.h"
#import "News.h"
#import "StringKeys.h"

@implementation RealmManager

#pragma mark - Create default

+ (void)createDefaultSource {
    if ([self isSourceEmpty]) {
        NSInteger sourceId = [Utils getSourceId];
        Source *source = [Source new];
        source.sourceId = sourceId;
        source.name = @"Лента.ру";
        source.urlString = @"https://lenta.ru/rss"; //http://law.edu.ru/rss/news.rss https://lenta.ru/rss
        source.isRead = true;
        
//        NSInteger sourceId = [Utils getSourceId];
//        Source *source = [Source new];
//        source.sourceId = sourceId;
//        source.name = @"Яндекс Технологии";
//        source.urlString = @"https://news.yandex.ru/computers.rss";
//        source.isRead = true;
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            [realm addOrUpdateObject:source];
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

#pragma mark - Get, Save & Delete Sources

+ (NSArray *)getSources {
    RLMResults *result = [Source allObjects];
    NSMutableArray *array = [NSMutableArray new];
    for (Source *source in result) {
        [array insertObject:source atIndex:0];
    }
    return array;
}

+ (NSArray *)getReadSources {
    NSArray *sourceArray = [self getSources];
    NSMutableArray *readArray = [NSMutableArray new];
    for (Source *source in sourceArray) {
        if (source.isRead) {
            [readArray addObject:source];
        }
    }
    return readArray;
}

+ (void)saveSource:(Source *)source {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:source];
    }];
}

+ (void)deleteSources {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    NSArray *array = [self getSources];
    for (Source *source in array) {
        if (source.isSelect) {
            [realm deleteObject:source];
        }
    }
    [realm commitWriteTransaction];
}

#pragma mark - Read & Select Sources

+ (void)updateReadFor:(NSInteger)sourceId {
    NSString *predicateString = [NSString stringWithFormat:@"sourceId == %ld",(long)sourceId];
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
    NSString *predicateString = [NSString stringWithFormat:@"sourceId == %ld",(long)sourceId];
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

#pragma mark - Get, Save & Delete Sources

+ (NSArray *)getNews {
    RLMResults *result = [News allObjects];
    NSMutableArray *array = [NSMutableArray new];
    for (News *news in result) {
        [array addObject:news];
    }
    return array;
}

+ (void)saveNews:(NSArray *)news {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        for (News *item in news) {
            [realm addObject:item];
        }
    }];
}

+ (void)deleteNews {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    NSArray *array = [self getNews];
    for (News *news in array) {
        [realm deleteObject:news];
    }
    [realm commitWriteTransaction];
}

+ (void)deleteNewsFrom:(NSString *)source {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    NSArray *array = [self getNews];
    for (News *news in array) {
        if ([news.sourceName isEqualToString:source]) {
            [realm deleteObject:news];
        }
    }
    [realm commitWriteTransaction];
}

@end
