#!/bin/bash
#
# TMNotifier - Easy email notifications for Time Machine
# Copyright 2015 James Barclay
#
# This script builds a deployment package for TMNotifier

declare -x chmod="/bin/chmod"
declare -x cp="/bin/cp"
declare -x find="/usr/bin/find"
declare -x mkdir="/bin/mkdir"
declare -x pkgbuild="/usr/bin/pkgbuild"

declare -x SCRIPT="${0##*/}"
declare -x SCRIPT_PATH="$0" RUN_DIRECTORY="${0%/*}"

declare -x PROJECT_DOMAIN="com.everythingisgray.TMNotifier"
declare -x PROJECT_NAME="TMNotifier"
declare -x INSTALL_PATH="/Applications"
declare -x VERSION="$(awk 'c&&!--c; /CFBundleShortVersionString/{c=1}' "$RUN_DIRECTORY/../build/Applications/TMNotifier.app/Contents/Info.plist"|grep -o '<string>.*</string>'|sed 's/<string>//g'|sed 's/<\/string>//g')"
declare -x TMP_PATH="/private/tmp/$PROJECT_NAME-$VERSION-${$}$RANDOM"
declare -x BUILD_DIR="$RUN_DIRECTORY/../build"
declare -x PACKAGE_ID="$PROJECT_NAME.$VERSION"

main () {
    # Create $BUILD_DIR if it doesn't exist.
    if [[ ! -d "$BUILD_DIR" ]]; then
        $mkdir -p "$BUILD_DIR/Applications"
    fi

    # Create the tmp directory if needed.
    if [[ ! -d "$TMP_PATH/$INSTALL_PATH" ]]; then
        $mkdir -p "$TMP_PATH/$INSTALL_PATH"
    fi

    # Copy the files to the tmp locations.
    $cp -Rvp "$RUN_DIRECTORY/../build/Applications/TMNotifier.app" "$TMP_PATH/$INSTALL_PATH/"

    # Make sure postinstall is executable.
    $chmod a+x "$RUN_DIRECTORY/../scripts/postinstall"

    # Clean up Python bytecode files before building
    $find "$RUN_DIRECTORY/../scripts" -name "*.pyc" -exec rm {} \;

    # Build the PKG.
    $pkgbuild --identifier "$PACKAGE_ID" \
              --root "$TMP_PATH/" \
              --scripts "$RUN_DIRECTORY/../scripts" \
              "$BUILD_DIR/$PROJECT_NAME-$VERSION.pkg"
}

main

exit $?
