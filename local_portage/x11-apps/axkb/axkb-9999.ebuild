# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit qt4 git

EGIT_REPO_URI="git://github.com/disels/axkb.git"

DESCRIPTION="Antico XKB - Antico keyboard layer switcher"
HOMEPAGE="http://www.antico.netsons.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/qt-gui:4"
RDEPEND="${DEPEND}"

src_compile() {
	eqmake4 AXKB.pro || die "qmake failed"
	emake || die "emake failed"
}

src_install() {
	emake INSTALL_ROOT="${D}" install || die "emake install failed"
	dodoc NEWS README TODO || die "dodoc failed"
}
