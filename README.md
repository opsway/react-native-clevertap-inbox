
# react-native-clever-tap-inbox

## Getting started

`$ npm install react-native-clever-tap-inbox --save`

### Mostly automatic installation

`$ react-native link react-native-clever-tap-inbox`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-clever-tap-inbox` and add `RNCleverTapInbox.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNCleverTapInbox.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNCleverTapInboxPackage;` to the imports at the top of the file
  - Add `new RNCleverTapInboxPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-clever-tap-inbox'
  	project(':react-native-clever-tap-inbox').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-clever-tap-inbox/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-clever-tap-inbox')
  	```

## Usage
```javascript
import RNCleverTapInbox from 'react-native-clever-tap-inbox';

// TODO: What to do with the module?
RNCleverTapInbox;
```
