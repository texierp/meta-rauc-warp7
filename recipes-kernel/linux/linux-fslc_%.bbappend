FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "\
	file://rauc.cfg \
"

do_configure_append () {
	cat ../rauc.cfg >> ${B}/.config
}
