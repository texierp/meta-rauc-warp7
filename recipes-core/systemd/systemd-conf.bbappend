FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	file://watchdog \
"

do_install_append() {
	cat ${WORKDIR}/watchdog >> ${D}${sysconfdir}/systemd/system.conf
}
