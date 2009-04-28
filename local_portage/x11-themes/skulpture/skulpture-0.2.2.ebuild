# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

CMAKE_IN_SOURCE_BUILD=ON
inherit cmake-utils qt4

DESCRIPTION="Widget style + kwin decoration. Skulpture aims to provide an easy
to the eyes 3D User interface."
HOMEPAGE="http://www.kde-look.org/content/show.php?content=59031"
SRC_URI="http://skulpture.maxiom.de/releases/${P}.tar.bz2"

IUSE="debug"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="~amd64 ~x86"

src_install() {
	kde4-base_src_install
#	mv "${D}"/usr/share/apps/kwin/skulpture.desktop \
#			"${D}"/usr/share/apps/kwin/skulpture-${SLOT}.desktop \
#			|| die "moving desktop file failed"
}

#LICENSE=""
#SLOT="0"
#KEYWORDS="~amd64"
#IUSE=""
#
#DEPEND="x11-libs/qt:4"
#RDEPEND="${DEPEND}"
