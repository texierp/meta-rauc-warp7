FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
	file://system.conf \
	file://ca.cert.pem \
	file://post-install.sh \
"

do_install_append () {
    install -Dm 0755 ${WORKDIR}/post-install.sh ${D}${libdir}/rauc/post-install.sh
}
