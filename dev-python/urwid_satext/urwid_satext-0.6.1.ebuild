# Copyright 2012-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 )

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

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=">=dev-python/urwid-1.2.0[${PYTHON_USEDEP}]"

src_prepare() {
	default

	sed -i '/distribute_setup/d' setup.py
	sed -i '/use_setuptools/d' setup.py

	sed -i "s#% name#% '${PF}'#" setup.py
}

DOCS=( CHANGELOG COPYING COPYING.LESSER README )
