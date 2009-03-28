# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Pretty invoices"
HOMEPAGE="http://kraft.sourceforge.net/"
SRC_URI="mirror://sourceforge/kraft/${P}.tar.bz2"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${P}"

src_compile() {
	echo '   Nothing to compile'
}

src_install() {
	distutils_python_version

	site_pkgs="/usr/$(get_libdir)/python${PYVER}/site-packages/"
	export PYTHONPATH="${PYTHONPATH}:${D}/${site_pkgs}"
	dodir ${site_pkgs}/trml2pdf
	insinto ${site_pkgs}/trml2pdf
	doins trml2pdf/*.py
}
