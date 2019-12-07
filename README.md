
# Xmader/google-recorder

> make [Google Recorder](https://play.google.com/store/apps/details?id=com.google.android.apps.recorder) run on any Android devices (Android >= 9)

> *Google Recorder is only officially available for Pixel >=2 phones currently.*

## Dependencies 

* [OpenJDK](https://openjdk.java.net/install/)
* [Apktool](https://github.com/iBotPeaches/Apktool)
* a keystore for `jarsigner` to sign the apk file

## Usage

```bash
export KEYSTORE_FILE=<path to your keystore file>
export KEYSTORE_ALIAS=<your keystore alias>

./patch.sh
```

## License

MIT
