# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Image uploader to several popular hostings"
HOMEPAGE="http://code.google.com/p/uimge/"

FNAME="Uimge"
SRC_URI="http://uimge.googlecode.com/files/${FNAME}-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="imaging"

RDEPEND="
		dev-lang/python
		imaging? ( dev-python/imaging )
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${FNAME}-${PV}"

src_compile() {
	distutils_src_compile
	}

src_install() {
	distutils_python_version

	distutils_src_install
	chmod 755 ${D}/usr/$(get_libdir)/python${PYVER}/site-packages/uimge/uimge.py
	dosym /usr/$(get_libdir)/python${PYVER}/site-packages/uimge/uimge.py usr/bin/uimge
	}
