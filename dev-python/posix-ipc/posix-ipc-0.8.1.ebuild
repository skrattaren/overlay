# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"

MY_P=${PN/-/_}-${PV}

inherit distutils

DESCRIPTION="POSIX IPC for Python"
HOMEPAGE="http://semanchuk.com/philip/posix_ipc/"
SRC_URI="http://semanchuk.com/philip/posix_ipc/${MY_P}.tar.gz"

RESTRICT="mirror"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}
