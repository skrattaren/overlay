# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Balancer, http://balancer.ru/files/0809/cuberok-0.0.3.ebuild.tar.bz2
# Further editing by krigstask, sterkrig@home.no

EAPI="2"

inherit eutils qt4
PKG_VER=${PN}-${PV}

DESCRIPTION="Yet another music player based on Qt4"
HOMEPAGE="http://cuberok.googlecode.com"
SRC_URI="http://cuberok.googlecode.com/files/${PKG_VER}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="audiere musepack ogg vorbis alsa oss mad flac aac phonon"

DEPEND=""
RDEPEND="x11-libs/qt-core:4
    x11-libs/qt-gui:4
	media-libs/taglib
	gstreamer? ( media-libs/gstreamer 
				 media-libs/gst-plugins-ugly 
				 media-plugins/gst-plugins-taglib )
	gstreamer? (
				musepack? ( media-plugins/gst-plugins-musepack )
				vorbis? ( media-plugins/gst-plugins-vorbis )
				flac? ( media-plugins/gst-plugins-flac )
				aac? ( media-plugins/gst-plugins-faad )
				oss? ( media-plugins/gst-plugins-oss )
				alsa? ( media-plugins/gst-plugins-alsa )
				mad? ( media-plugins/gst-plugins-mad )
				ogg? ( media-plugins/gst-plugins-ogg )
				)
	audiere? ( media-libs/audiere )
	phonon?  ( media-sound/phonon )
"	

src_compile() {
	lupdate Cuberok.pro -ts locale\cuberok_ru.ts
	lrelease locale\cuberok_ru.ts -qm locale\cuberok_ru.qm
	qmake Cuberok.pro || die "qmake failed!"
	make || die "Make failed!"
}

src_install() {
	dobin unix/cuberok
	insinto /usr/lib/cuberok
	doins unix/plugins/*
	dodoc Changelog README license.txt
	doicon images/MatieresExplosives.png

	make_desktop_entry cuberok Cuberok MatieresExplosives.png "Application;AudioVideo;AudioPlayer"
}
