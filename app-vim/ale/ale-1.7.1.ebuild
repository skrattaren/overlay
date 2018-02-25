# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vim-plugin

MY_PN="ack.vim"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="vim plugin: run ack from vim"
HOMEPAGE="https://github.com/w0rp/ack.vim"
SRC_URI="https://github.com/w0rp/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="BSD-2"
KEYWORDS="~amd64"
