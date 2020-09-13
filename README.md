# app_launcher
[![Pub](https://img.shields.io/pub/v/app_launcher.svg?style=flat-square&logo=dart&logoColor=white&color=blue)](https://pub.dev/packages/app_launcher)
[![License](https://img.shields.io/badge/license-MIT-purple.svg?style=flat-square)](LICENSE)

A flutter plugin that launches an Android or iOS installed on the device using the application ID.  

#### NOTICE
> Supports only Android as of now. PRs for iOS support will be very appreciated.

## Usage
Simply call the `openApp` static method and pass in your application ID as a String:
```dart
RaisedButton(
  onPressed: () async {
    await AppLauncher.openApp(
      androidApplicationId: "com.whatsapp",
    );
  },
  child: Text('Open WhatsApp'),
),
```

**Note: the `androidApplicationId` must neither be empty nor `null`.  

## TODO
- [x] Android Support.
- [ ] iOS Support.
- [ ] Open Google Play / AppStore when app not found.
- [ ] Support passing arguments.

## Example
Check the examples [tab](https://pub.dev/packages/flutter_text_drawable/example) or take a look at the example [file](https://github.com/Akora-IngDKB/app_launcher/blob/master/example/lib/main.dart).

## Contribution
This project is fully open-source. Feel free to open issues when you realize one and PRs are welcome as well.  

## License
This project has been licensed under the MIT License. Check the [LICENSE](LICENSE) file for the details.
