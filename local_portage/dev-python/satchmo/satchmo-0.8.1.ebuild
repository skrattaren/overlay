# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/django/django-9999.ebuild,v 1.2 2008/10/06 18:42:46 pythonhead Exp $

SRC_URI="http://satchmoproject.com/snapshots/${PN}-${PV}.tar.gz"

inherit distutils

DESCRIPTION="A Django-based webstore"
HOMEPAGE="http://satchmoproject.com/"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc ~x86"
IUSE=""

RDEPEND="dev-python/django"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-${PV}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${PN}-0.8-shop-l10n-ru.patch"
}
src_compile() {
	distutils_src_compile
}

src_install() {
	distutils_python_version

	site_pkgs="/usr/$(get_libdir)/python${PYVER}/site-packages/"
	export PYTHONPATH="${PYTHONPATH}:${D}/${site_pkgs}"
	dodir ${site_pkgs}

	distutils_src_install

	dodir ${site_pkgs}/satchmo/locale/ru/LC_MESSAGES
	insinto ${site_pkgs}/satchmo/locale/ru/LC_MESSAGES
	doins "${FILESDIR}"/django*
	rename django_ru django ${D}/${site_pkgs}/satchmo/locale/ru/LC_MESSAGES/django_ru*
}
