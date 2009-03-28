# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils qt4

MY_P="85360-${P}-20090212"
DESCRIPTION="On Screen Display (OSD) for KDE 4.x"
HOMEPAGE="http://www.kochkin.org/"
SRC_URI="http://www.kde-apps.org/CONTENT/content-files/${MY_P}.tar.bz2"
RESTRICT="mirror"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="|| ( x11-libs/qt-gui:4 =x11-libs/qt-4.3*:4 )"
RDEPEND="${DEPEND}"

src_compile() {
	cd "${WORKDIR}/${PN}"
	eqmake4 || die "eqmake failed"
	emake || die "emake failed"
}

src_install() {
	cd "${WORKDIR}/${PN}"
	emake install INSTALL_ROOT=${D} || die "einstall failed"
	cp ${D}/var/tmp/portage/${CATEGORY}/${PF}/homedir/.kde/Autostart/okindd.desktop ${D}/usr/share/doc/okind/examples
	cp ${D}/var/tmp/portage/${CATEGORY}/${PF}/homedir/.okind/okinddrc.example ${D}/usr/share/doc/okind/examples

}

pkg_postinst() {
	elog "Copy file /usr/share/doc/okind/examples/okindd.desktop"
	elog "to your ~/.kde4/Autostart folder to autoload okindd when starting KDE4."
	elog "If this first install of okindd, copy /usr/share/doc/okind/examples/okinddrc.example"
	elog "to '~/.okind/okinddrc'"
}