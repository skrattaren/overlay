# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/django/django-9999.ebuild,v 1.2 2008/10/06 18:42:46 pythonhead Exp $

ESVN_REPO_URI="http://sorl-thumbnail.googlecode.com/svn/trunk/"

inherit distutils subversion

DESCRIPTION="high-level python web framework"
HOMEPAGE="http://www.djangoproject.com/"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc ~x86"
IUSE=""

RDEPEND="dev-python/django"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_compile() {
	distutils_src_compile
}

src_install() {
	distutils_python_version

	site_pkgs="/usr/$(get_libdir)/python${PYVER}/site-packages/"
	export PYTHONPATH="${PYTHONPATH}:${D}/${site_pkgs}"
	dodir ${site_pkgs}

	distutils_src_install

#	dobin django/bin/{compile-messages,daily_cleanup,make-messages,unique-messages,profiling/gather_profile_stats}.py
#	doman docs/man/*
}
