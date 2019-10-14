FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	file://warp7-wifi.network \
"

do_install_append() {
	install -Dm 0644 ${WORKDIR}/warp7-wifi.network ${D}${sysconfdir}/systemd/network/warp7-wifi.network
}

FILES_${PN} += " \
    ${sysconfdir}/systemd/network/warp7-wifi.network \
"
