
# react-native-clever-tap-inbox

## Getting started

`$ npm install react-native-clevertap-inbox --save`

### Mostly automatic installation

`$ react-native link react-native-clevertap-inbox`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-clevertap-inbox` and add `RNCleverTapInbox.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNCleverTapInbox.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.opsway.react.RNCleverTapInboxPackage;` to the imports at the top of the file
  - Add `new RNCleverTapInboxPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-clevertap-inbox'
  	project(':react-native-clevertap-inbox').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-clevertap-inbox/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-clevertap-inbox')
  	```

## Usage
```javascript
import RNCleverTapInbox from 'react-native-clevertap-inbox';

//Initialize App Inbox

RNCleverTapInbox.initializeInbox();

//Get Inbox Message Count

RNCleverTapInbox.getInboxMessageCount().then(count => {
  console.log('All messages count: ', count);
});

//Get Inbox Unread Count

RNCleverTapInbox.getInboxMessageUnreadCount().then(count => {
  console.log('Unread messages count: ', count);
});

//Get All messages

RNCleverTapInbox.getAllInboxMessages().then((response: string) => {
  const messages = JSON.parse(response);
  
  console.log('All messages: ', messages);
});

//Get only Unread messages

RNCleverTapInbox.getUnreadInboxMessages().then((response: string) => {
  const messages = JSON.parse(response);
  
  console.log('All unread messages: ', messages);
});

//Mark all Unread messages as Read

RNCleverTapInbox.markReadAllUnreadInboxMessages().then((success: boolean) => {
  success && console.log(`All unread messages marked as read!`);
});

//Mark Message as Read

RNCleverTapInbox.markReadInboxMessage(messageId: string).then((success: boolean) => {
  success && console.log(`Message with id ${messageId} marked as read!`);
});

//Delete message from the Inbox

RNCleverTapInbox.deleteInboxMessage(messageId: string).then((success: boolean) => {
  success && console.log(`Message with id ${messageId} deleted!`);
});

```
