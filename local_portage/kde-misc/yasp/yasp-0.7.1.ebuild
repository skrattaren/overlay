# Copyright 1999-2008 Gentoo Foundation    
# Distributed under the terms of the GNU General Public License v2
# $Header: $                                                      

EAPI="2"

inherit kde4-base

DESCRIPTION="Yet Another SystemMonitor Plasmoid"
HOMEPAGE="http://kde-look.org/content/show.php/yasp+Yet+Another+SystemMonitor+Plasmoid+?content=94144"
LICENSE="GPL"                                                                                         

KEYWORDS="~amd64 ~x86"
IUSE="nvidia"
SLOT="4.2"   

SRC_URI="http://kde-look.org/CONTENT/content-files/94144-yasp-${PV}.tar.bz2"


DEPEND="kde-base/kdelibs:${SLOT}
		nvidia? ( media-video/nvidia-settings )
	    "                                       

W="${WORKDIR}/${P}"

src_unpack(){
	unpack 94144-yasp-${PV}.tar.bz2 || die "unpack"
	if use !nvidia                                 
	then cat ${W}/CMakeLists.txt | sed /NVidia/d > ${W}/CMakeLists.txt_new 
		rm ${W}/CMakeLists.txt && mv ${W}/CMakeLists.txt_new ${W}/CMakeLists.txt
	fi                                                                           
}
