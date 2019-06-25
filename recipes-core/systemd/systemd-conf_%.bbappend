FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	file://watchdog \
	file://warp7-wifi.network \
"

do_install_append() {
	cat ${WORKDIR}/watchdog >> ${D}${sysconfdir}/systemd/system.conf
	
	install -m 0644 ${WORKDIR}/warp7-wifi.network ${D}${sysconfdir}/systemd/network/
}
