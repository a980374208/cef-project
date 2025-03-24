# Copyright (c) 2024 The Chromium Embedded Framework Authors. All rights
# reserved. Use of this source code is governed by a BSD-style license that
# can be found in the LICENSE file.

#
# THIS FILE IS AUTO-GENERATED. DO NOT EDIT BY HAND.
#
# Use the following command to update version information:
# % python3 ./tools/bazel/version_updater.py --version=<version> [--url=<url>]
#
# Specify a fully-qualified CEF version. Optionally override the default
# download URL.
#
# CEF binary distribution file names are expected to take the form
# "cef_binary_<version>_<platform>.tar.bz2". These files must exist for each
# supported platform at the download URL location. Sha256 hashes must also
# exist for each file at "<file_name>.sha256".
#

CEF_DOWNLOAD_URL = "https://cef-builds.spotifycdn.com/"

CEF_VERSION = "134.3.7+g37e6a40+chromium-134.0.6998.118"

# Map of supported platform to sha256 for binary distribution download.
CEF_FILE_SHA256 = {
    "windows32": "3898f5060c56be0e97a1e0615bb3743c59a7bdc3c3e6b14b69a1452aece3ad8a",
    "windows64": "9affbb6bd71be888933214982921b1837c94293283771323c978db0293b89956",
    "windowsarm64": "039dec34a4a0e1a71b595d0471a0542c1d198ddc8a46368b2e21d8cfff8fc126",
    "macosx64": "27f4dac28b39cba5e67bd9d9eb037ade1fb8085c832ffc60faa649ab12af3abd",
    "macosarm64": "306a145bf69a8b3b0adef1971511610444e746cbdbe6573b8a697b426ce0681a",
    "linux64": "556d605bfdb100357fa454fcc83d88914f96c5a88b2a72ffb6d881a5a1ae56f2",
    "linuxarm64": "32a702d014f18b452cd6f7a13dd55d88f45e45e994abd4b79a7cc979db990007",
    "linuxarm": "8cc9f63acc00ed2c17e6b0e1d1c5a74d7375ac83884fec022262e42ed64d2213",
}
