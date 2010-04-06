# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils eutils

DESCRIPTION="A scrobbling daemon, implemented in Python"
HOMEPAGE="http://www.red-bean.com/~decklin/software/lastfmsubmitd/"
SRC_URI="http://www.red-bean.com/~decklin/software/lastfmsubmitd/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh
~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	distutils_src_install
	doinitd ${FILESDIR}/lastfmsubmitd
	insinto /etc
	doins ${FILESDIR}/lastfmsubmitd.conf
	for x in log run spool ; do
		install -d ${D}/var/$x/lastfm
		fowners lastfm /var/$x/lastfm
		fperms 775 /var/$x/lastfm
		keepdir /var/$x/lastfm
	done

	touch ${D}/var/log/lastfm/lastfm.log
	fowners lastfm /var/log/lastfm/lastfm.log
}

pkg_postinst () {
	einfo
	einfo "You must edit '/etc/lastfmsubmitd.conf' before use."
	einfo
}


pkg_setup () {
	enewuser lastfm -1 "/bin/sh"
}

