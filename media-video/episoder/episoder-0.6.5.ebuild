# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_5,2_6,2_7} )
PYTHON_REQ_USE="sqlite"

inherit distutils-r1

DESCRIPTION="episoder is a tool to tell you when new episodes of your favourite TV shows are airing"
HOMEPAGE="https://code.google.com/p/episoder/"
SRC_URI="https://episoder.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/beautifulsoup
		dev-python/sqlalchemy
		dev-python/pyyaml"
RDEPEND="${DEPEND}"

