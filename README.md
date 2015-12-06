# cordova-plugin-detect-screenshot
Detects screenshots on Cordova for iOS. The plugin will only work on devices with iOS >= 7, however feel free to include this plugin in projects with a lower target than iOS 7. The plugin checks the iOS version before listening for events, so it won't break anything.

## Installation
`cordova plugin add cordova-plugin-detect-screenshot`

## Usage
When a screenshot occurs, a 'screenshot' event is triggered. Simply listen for this event in your javascript.

    document.addEventListener("screenshot", function() {
        window.alert("Screenshot");
    }, false);
    
## License 
MIT.
