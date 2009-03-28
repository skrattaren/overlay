# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/django/django-9999.ebuild,v 1.2 2008/10/06 18:42:46 pythonhead Exp $

SRC_URI="http://banjo.assembla.com/spaces/threaded_multihost/documents/c3Iwp42jyr3Bl9ab7jnrAJ/download/django-threaded-multihost-1.3-0.tar.gz"

inherit distutils

DESCRIPTION="A Django multihost app for Satchmo webshop"
HOMEPAGE="http://gosatchmo.com/apps/django-threaded-multihost/"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc ~x86"
IUSE=""

RDEPEND="dev-python/django"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-1.3-0"

src_compile() {
	distutils_src_compile
}

src_install() {
	distutils_python_version

	site_pkgs="/usr/$(get_libdir)/python${PYVER}/site-packages/"
	export PYTHONPATH="${PYTHONPATH}:${D}/${site_pkgs}"
	dodir ${site_pkgs}

	distutils_src_install
}
