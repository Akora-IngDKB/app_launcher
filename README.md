# app_launcher

[![Pub](https://img.shields.io/pub/v/app_launcher.svg?style=flat-square&logo=dart&logoColor=white&color=blue)](https://pub.dev/packages/app_launcher)
[![License](https://img.shields.io/badge/license-MIT-purple.svg?style=flat-square)](LICENSE)

A flutter plugin that launches an Android or iOS installed on the device using the application ID.

[![Lice![app_launcher_example](https://github.com/user-attachments/assets/6ef667f8-fcd3-431a-a173-f8c0e8d08784)

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

If app is not installed, it'll attempt to open the app details on Google Play.

You can also check if the app is installed on the device.

```dart
final bool isInstalled = await AppLauncher.openApp(
  androidApplicationId: "com.whatsapp",
);
```

`isInstalled` will be `true` if found and `false` otherwise.

**Note: the `androidApplicationId` must neither be empty nor `null`**.

## TODO

- [x] Android Support.
- [x] Open Google Play when app not found.
- [ ] iOS Support.
- [ ] Open AppStore when app not found.
- [ ] Support passing arguments.

## Example

Check the examples [tab](https://pub.dev/packages/app_launcher/example) or take a look at the example [file](https://github.com/Akora-IngDKB/app_launcher/blob/master/example/lib/main.dart).

## Contribution

This project is fully open-source. Feel free to open issues when you realize one and PRs are welcome as well.

## License

This project has been licensed under the MIT License. Check the [LICENSE](LICENSE) file for the details.
