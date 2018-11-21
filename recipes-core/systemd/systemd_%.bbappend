FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	file://warp7-wifi.network \
	file://watchdog \
"

do_install_append() {
	install -m 0644 ${WORKDIR}/warp7-wifi.network ${D}${sysconfdir}/systemd/network/
	cat ${WORKDIR}/watchdog >> ${D}${sysconfdir}/systemd/system.conf
}
