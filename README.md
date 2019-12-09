
# Xmader/google-recorder

> Get the powerful [Google Recorder](https://play.google.com/store/apps/details?id=com.google.android.apps.recorder) app run on any Android device (Android >= 9).  
> Fuck off, device restrictions.

> *Google Recorder is only officially available for Pixel >=2 phones currently.*

## Requirements 

* [OpenJDK](https://openjdk.java.net/install/)
* [Apktool](https://github.com/iBotPeaches/Apktool)
* a keystore for `jarsigner` to sign the apk file

## Usage

```bash
export KEYSTORE_FILE=<path to your keystore file>
export KEYSTORE_ALIAS=<your keystore alias>

./patch.sh
```

## How

Google added some restrictions if you want to [sideload](https://www.xda-developers.com/pixel-4-recorder-app-screen-attention-older-pixel/) the app to install it on other Android devices.

The Google Recorder app [checks](https://developer.android.com/reference/android/content/pm/PackageManager.html#hasSystemFeature(java.lang.String)) for the `com.google.android.feature.PIXEL_2017_EXPERIENCE` system feature to ensure that it is running on Pixel 2 or later phones.  

If the system feature doesn't exist, it throws an error and the app exits immediately.

* pseudocode by decompiling / analysing  the `com/google/android/apps/recorder/ui/application/RecorderApplication.java` file

```java
    public void onCreate() {
        super.onCreate();
        if (isDevBuild() || getPackageManager().hasSystemFeature("com.google.android.feature.PIXEL_2017_EXPERIENCE")) {
            // …
        }
        throw new IllegalStateException("Cannot start Recorder on unsupported device");
    }
```

This patch replaces the `com.google.android.feature.PIXEL_2017_EXPERIENCE` string with `android.hardware.microphone` that every phone / Android device should have this system feature if the device can record audio,  
so that the patched app will only check for the `android.hardware.microphone` system feature, and won't exit immediately.

* [patch.sh#L14-L16](patch.sh#L14-L16)

```bash
STR1="com.google.android.feature.PIXEL_2017_EXPERIENCE"
STR2="android.hardware.microphone"
sed -i "s/$STR1/$STR2/" $FILE_TO_PATCH_0
```

## Download Artifacts

[Github Release](https://github.com/Xmader/google-recorder/releases/latest)

## License

MIT
