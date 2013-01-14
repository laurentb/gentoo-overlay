# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="SàT extension widgets for Urwid"
HOMEPAGE="http://wiki.goffi.org/wiki/Urwid-satext
http://pypi.python.org/pypi/urwid_satext"
SRC_URI="ftp://ftp.goffi.org/urwid-satext/${P}.tar.bz2
mirror://pypi/${PN:0:1}/${PN}/${P}.tar.bz2"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/urwid"

src_prepare() {
	sed -i "s#% name#% '${PF}'#" setup.py
}
