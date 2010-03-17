# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils eutils

DESCRIPTION="Bitten is a Python-based framework for collecting various software
metrics via continuous integration."
HOMEPAGE="http://bitten.edgewall.org"
MY_P=${PN/b/B}-${PV/_beta/b}
SRC_URI="http://ftp.edgewall.com/pub/bitten/${MY_P}.tar.gz"

LICENSE="BSD-revised"
KEYWORDS="~x86 ~amd64"
IUSE="+master"
RESTRICT="mirror"

SLOT="0"

RDEPEND="master? ( =www-apps/trac-0.11* )
		=dev-lang/python-2*"

BDEPEND="
	>=dev-python/setuptools-0.6_rc1"

S="${WORKDIR}/${MY_P}"

pkg_setup() {
	DISTUTILS_GLOBAL_OPTIONS=($(use_with master))
}

src_test() {
	"${python}" setup.py test || die "tests failed"
}

pkg_postinst() {
	if use master ; then
		elog "To enable the Bitten plugin in your Trac environments, you have to add:"
		elog "    [components]"
		elog "    bitten.* = enabled"
		elog "to your trac.ini files."
	fi
}

