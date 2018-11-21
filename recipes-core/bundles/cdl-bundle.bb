DESCRIPTION = "RAUC bundle generator"

inherit bundle

RAUC_BUNDLE_COMPATIBLE = "AwesomeProduct"
RAUC_BUNDLE_VERSION = "v2018-11-17-1"
RAUC_BUNDLE_DESCRIPTION = "Simple Demo Bundle for CDL"
RAUC_BUNDLE_SLOTS = "rootfs" 
RAUC_SLOT_rootfs = "core-image-base"
RAUC_SLOT_rootfs[fstype] = "ext4"

RAUC_KEY_FILE = "${THISDIR}/files/development-1.key.pem"
RAUC_CERT_FILE = "${THISDIR}/files/development-1.cert.pem"
