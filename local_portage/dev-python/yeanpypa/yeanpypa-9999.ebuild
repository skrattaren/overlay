# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

ESVN_REPO_URI="https://vcs.slash-me.net/snippets/yeanpypa/"

inherit distutils subversion

DESCRIPTION="Yeanpypa is a Python parser framework"
HOMEPAGE="http://www.slash-me.net/dev/snippets/yeanpypa/documentation.html"
LICENSE="Public domain"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc ~x86"
IUSE=""

RDEPEND="dev-lang/python"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_compile() {
	echo '    Nothing to compile'
}

src_install() {
	distutils_python_version

	site_pkgs="/usr/$(get_libdir)/python${PYVER}/site-packages/"
	export PYTHONPATH="${PYTHONPATH}:${D}/${site_pkgs}"
	dodir ${site_pkgs}/${PN}
	insinto ${site_pkgs}/${PN}
	doins *.py
	dodoc *.css *.xsl *.xml
}
