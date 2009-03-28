# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit cmake-utils eutils font

MY_P=mscore-${PV}

DESCRIPTION="WYSIWYG Music Score Typesetter"
HOMEPAGE="http://mscore.sourceforge.net"
SRC_URI="mirror://sourceforge/mscore/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~sparc ~x86"
IUSE=""

RDEPEND="sys-libs/zlib
	media-libs/alsa-lib
	media-sound/fluidsynth
	media-sound/jack-audio-connection-kit
	media-libs/portaudio
	x11-libs/qt-gui[accessibility,qt3support]"
DEPEND="${RDEPEND}
	|| ( dev-texlive/texlive-context app-text/tetex )
	>=dev-util/cmake-2.6
	dev-util/pkgconfig"

S=${WORKDIR}/${MY_P}/mscore
VARTEXFONTS=${T}/fonts
FONT_SUFFIX=otf
FONT_S=${S}/mscore/fonts

src_compile() {
	cmake-utils_src_compile
	cd ${S}/../../musescore_build
	emake lrelease || die "handling localization files failed"
}

src_install() {
	cmake-utils_src_install
	font_src_install
	dodoc ChangeLog NEWS README
	doman packaging/mscore.1
}
