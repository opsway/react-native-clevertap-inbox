//
//  CleverTapInbox.m
//
//  Created by Anton Baldin on 2/28/19.
//  Copyright © OpsWay. All rights reserved.
//

#import "RNCleverTapInbox.h"
#import <CleverTap-iOS-SDK/CleverTap+Inbox.h>

@implementation RNCleverTapInbox

RCT_EXPORT_MODULE();

//Initialize App Inbox

RCT_EXPORT_METHOD(initializeInbox)
{
  @try {
    dispatch_async(dispatch_get_main_queue(), ^{
      [[CleverTap sharedInstance] initializeInboxWithCallback:^(BOOL success) {
        int messageCount = (int)[[CleverTap sharedInstance] getInboxMessageCount];
        int unreadCount = (int)[[CleverTap sharedInstance] getInboxMessageUnreadCount];
        NSLog(@"Inbox Messages: %d/%d", messageCount, unreadCount);
      }];
    });
  }
  @catch (NSException *exception) {
    NSLog(@"%@", exception.reason);
  }
}

//Get Inbox Message Count

RCT_EXPORT_METHOD(getInboxMessageCount:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
{
  @try {
    dispatch_async(dispatch_get_main_queue(), ^{
      NSUInteger count = [[CleverTap sharedInstance] getInboxMessageCount];

      resolve(@(count));
    });
  }
  @catch (NSException *exception) {
    NSLog(@"%@", exception.reason);
  }
}

//Get Inbox Unread Count

RCT_EXPORT_METHOD(getInboxMessageUnreadCount:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
{
  @try {
    dispatch_async(dispatch_get_main_queue(), ^{
      NSUInteger count = [[CleverTap sharedInstance] getInboxMessageUnreadCount];

      resolve(@(count));
    });
  }
  @catch (NSException *exception) {
    NSLog(@"%@", exception.reason);
  }
}

//Get All messages

RCT_EXPORT_METHOD(getAllInboxMessages:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
{
  @try {
    dispatch_async(dispatch_get_main_queue(), ^{
      NSArray<CleverTapInboxMessage *> * _Nonnull messages = [[CleverTap sharedInstance] getAllInboxMessages];
      NSData *jsonData = [NSJSONSerialization dataWithJSONObject:messages options:NSJSONWritingPrettyPrinted error:nil];
      NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];

      resolve(jsonString);
    });
  }
  @catch (NSException *exception) {
    NSLog(@"%@", exception.reason);
  }
}

//Get only Unread messages

RCT_EXPORT_METHOD(getUnreadInboxMessages:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
{
  @try {
    dispatch_async(dispatch_get_main_queue(), ^{
      NSArray<CleverTapInboxMessage *> * _Nonnull messages = [[CleverTap sharedInstance] getUnreadInboxMessages];
      NSData *jsonData = [NSJSONSerialization dataWithJSONObject:messages options:NSJSONWritingPrettyPrinted error:nil];
      NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];

      resolve(jsonString);
    });
  }
  @catch (NSException *exception) {
    NSLog(@"%@", exception.reason);
  }
}

//Mark all Unread messages as Read

RCT_EXPORT_METHOD(markReadAllUnreadInboxMessage:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
{
  @try {
    dispatch_async(dispatch_get_main_queue(), ^{
      NSArray<CleverTapInboxMessage *> * _Nonnull messages = [[CleverTap sharedInstance] getUnreadInboxMessages];

      for (id message in messages) {
        [[CleverTap sharedInstance] markReadInboxMessage:message];
      }

      resolve(nil);
    });
  }
  @catch (NSException *exception) {
    NSLog(@"%@", exception.reason);
  }
}

//Mark Message as Read

RCT_EXPORT_METHOD(markReadInboxMessage:(NSString *)messageId
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
{
  @try {
    dispatch_async(dispatch_get_main_queue(), ^{
      CleverTapInboxMessage * message = [[CleverTap sharedInstance] getInboxMessageForId:messageId];

      [[CleverTap sharedInstance] markReadInboxMessage:message];

      resolve(nil);
    });
  }
  @catch (NSException *exception) {
    NSLog(@"%@", exception.reason);
  }
}

//Delete message from the Inbox

RCT_EXPORT_METHOD(deleteInboxMessage:(NSString *)messageId
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
{
  @try {
    dispatch_async(dispatch_get_main_queue(), ^{
      CleverTapInboxMessage * message = [[CleverTap sharedInstance] getInboxMessageForId:messageId];

      [[CleverTap sharedInstance] deleteInboxMessage:message];

      resolve(nil);
    });
  }
  @catch (NSException *exception) {
    NSLog(@"%@", exception.reason);
  }
}

@end
