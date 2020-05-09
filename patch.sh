#!/bin/sh

APK_FILE="com.google.android.apps.recorder.11007013.apk"
APK_OUT_DIR="apk-out"
DIST_APK_FILE="dist/google-recorder.apk"

apktool decode $APK_FILE \
        --match-original \
        -api 29 \
        -o $APK_OUT_DIR

# patch
FILE_TO_PATCH_0="$APK_OUT_DIR/smali/com/google/android/apps/recorder/ui/application/RecorderApplication.smali"
STR1="com.google.android.feature.PIXEL_2017_EXPERIENCE"
STR2="android.hardware.microphone"
sed -i "s/$STR1/$STR2/" $FILE_TO_PATCH_0

# FILE_TO_PATCH_1="$APK_OUT_DIR/res/layout/activity_main.xml"
# sed "6d" $FILE_TO_PATCH_1  # delete the 6th line (<com.google.android.libraries.material.productlockup.AnimatableProductLockupView …)

apktool build $APK_OUT_DIR \
        -api 29 \
        -o $DIST_APK_FILE

jarsigner -verbose \
          -sigalg SHA1withRSA -digestalg SHA1 \
          -keystore $KEYSTORE_FILE \
          $DIST_APK_FILE \
          $KEYSTORE_ALIAS

# clean up
rm -rf $APK_OUT_DIR

