# Copyright 2012-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="gcp (Goffi's cp) is a file copier with queuing, progress, FAT
support."
HOMEPAGE="http://wiki.goffi.org/wiki/Gcp"
SRC_URI="ftp://ftp.goffi.org/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/progressbar[${PYTHON_USEDEP}]"

src_prepare() {
	sed -i "s#.\+share/doc.\+#],#" setup.py
}

DOCS=( README CHANGELOG COPYING )
