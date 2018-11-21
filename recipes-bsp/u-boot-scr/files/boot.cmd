echo "#### RAUC boot script : CDL Demo" 

test -n "${BOOT_ORDER}" || setenv BOOT_ORDER "A B"
test -n "${BOOT_A_LEFT}" || setenv BOOT_A_LEFT 3
test -n "${BOOT_B_LEFT}" || setenv BOOT_B_LEFT 3
test -n "${BOOT_DEV}" || setenv BOOT_DEV "mmc 0:1"

setenv custom_bootargs
for BOOT_SLOT in "${BOOT_ORDER}"; do
  if test "x${custom_bootargs}" != "x"; then
    # skip remaining slots
  elif test "x${BOOT_SLOT}" = "xA"; then
    if test ${BOOT_A_LEFT} -gt 0; then
      setexpr BOOT_A_LEFT ${BOOT_A_LEFT} - 1
      echo "Found valid slot A, ${BOOT_A_LEFT} attempts remaining"
      setenv custom_bootargs "root=/dev/mmcblk1p2 rauc.slot=A"
      setenv BOOT_DEV "mmc 0:2"
    fi
  elif test "x${BOOT_SLOT}" = "xB"; then
    if test ${BOOT_B_LEFT} -gt 0; then
      setexpr BOOT_B_LEFT ${BOOT_B_LEFT} - 1
      echo "Found valid slot B, ${BOOT_B_LEFT} attempts remaining"
      setenv custom_bootargs "root=/dev/mmcblk1p3 rauc.slot=B"
      setenv BOOT_DEV "mmc 0:3"
    fi
  fi
done

if test -n "${custom_bootargs}"; then
  setenv bootargs "console=${console},${baudrate} ${custom_bootargs} rootwait rw"
  saveenv
else
  echo "No valid slot found, resetting tries to 3"
  setenv BOOT_A_LEFT 3
  setenv BOOT_B_LEFT 3
  saveenv
  reset
fi

load ${BOOT_DEV} 0x80800000 /boot/zImage
load ${BOOT_DEV} 0x83000000 /boot/imx7s-warp.dtb
bootz 0x80800000 - 0x83000000
