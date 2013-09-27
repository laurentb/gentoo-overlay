# Copyright 2012-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="SàT extension widgets for Urwid"
HOMEPAGE="http://wiki.goffi.org/wiki/Urwid-satext
https://pypi.python.org/pypi/urwid_satext"
SRC_URI="ftp://ftp.goffi.org/urwid-satext/${P}.tar.bz2
mirror://pypi/${PN:0:1}/${PN}/${P}.tar.bz2"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/urwid[${PYTHON_USEDEP}]"

src_prepare() {
	sed -i "s#% name#% '${PF}'#" setup.py
}
