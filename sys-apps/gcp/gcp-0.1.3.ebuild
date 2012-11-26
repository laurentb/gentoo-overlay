# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="gcp (Goffi's cp) is a file copier with queuing, progress, FAT
support."
HOMEPAGE="http://wiki.goffi.org/wiki/Gcp"
SRC_URI="ftp://ftp.goffi.org/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/progressbar"

src_prepare() {
	sed -i "s#.\+share/doc.\+#],#" setup.py
}

DOCS="README CHANGELOG COPYING"
