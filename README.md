
# Xmader/google-recorder

> Make the powerful [Google Recorder](https://play.google.com/store/apps/details?id=com.google.android.apps.recorder) app run on any Android devices (Android >= 9).  
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

## Download Artifacts

[Github Release](https://github.com/Xmader/google-recorder/releases/latest)

## License

MIT
