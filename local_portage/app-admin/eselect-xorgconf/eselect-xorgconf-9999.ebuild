# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="An eselect module to manage /etc//X11/xorg.conf symlink."
HOMEPAGE="http://code.google.com/p/krigstasks-samling/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="app-admin/eselect
		x11-base/xorg-server"

S="${WORKDIR}"

URI="https://krigstasks-samling.googlecode.com/hg/bin/xorg.conf.eselect"
FILE="${URI##*/}"

src_unpack() {
	DISTDIR="${S}"
	grep "^\s*FETCHCOMMAND=" /etc/make.globals > myenv
	grep "^\s*FETCHCOMMAND=" /etc/make.conf >> myenv
	. myenv
	eval ${FETCHCOMMAND}
}

src_install() {
	insinto /usr/share/eselect/modules
	newins "${FILE}" xorg.conf.eselect || die
}

pkg_postinst() {
	elog "Don't forget to rename your xorg.conf to something like xorg.conf.<your card name> prior to eselecting it"
}
