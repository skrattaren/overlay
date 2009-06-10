# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"

DESCRIPTION="Quotes from Linux.Org.Ru"
HOMEPAGE="http://lorquotes.ru/"
SRC_URI="http://sisyphus.ru/cgi-bin/srpm.pl/Sisyphus/fortunes-LOR/getsource/0 ->
fortunes-lor-0.1.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
#RESTRICT="mirror"

RDEPEND="games-misc/fortune-mod"

src_install() {
	mv fortunes-LOR lor
	/usr/bin/strfile lor
	insinto /usr/share/fortune
	doins lor lor.dat || die
}
