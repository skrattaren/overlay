# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/django/django-9999.ebuild,v 1.2 2008/10/06 18:42:46 pythonhead Exp $

ESVN_REPO_URI="http://django-cart.googlecode.com/svn/trunk/"

inherit distutils subversion

DESCRIPTION="A simple shopping cart for Django"
HOMEPAGE="http://django-cart.googlecode.com/"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc ~x86"
IUSE=""

RDEPEND="dev-python/django"
DEPEND="${RDEPEND}"

S="${WORKDIR}/trunk/cart"

src_compile() {
	echo '   Nothing to compile'
}

src_install() {
	distutils_python_version

	site_pkgs="/usr/$(get_libdir)/python${PYVER}/site-packages/"
	export PYTHONPATH="${PYTHONPATH}:${D}/${site_pkgs}"
	dodir ${site_pkgs}/${PN}
	insinto ${site_pkgs}/${PN}
	doins cart/*.py
}

