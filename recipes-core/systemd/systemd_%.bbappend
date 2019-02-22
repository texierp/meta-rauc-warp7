FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	file://warp7-wifi.network \
"

do_install_append() {
	install -m 0644 ${WORKDIR}/warp7-wifi.network ${D}${sysconfdir}/systemd/network/
}
