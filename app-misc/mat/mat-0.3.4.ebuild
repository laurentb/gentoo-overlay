# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Metadata Anonymisation Toolkit"
HOMEPAGE="https://mat.boum.org/"
SRC_URI="https://mat.boum.org/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+exif +audio +pdf gtk"

DEPEND="dev-python/python-distutils-extra
dev-python/hachoir-core
dev-python/hachoir-parser"
RDEPEND="${DEPEND}
exif? ( media-libs/exiftool )
audio? ( media-libs/mutagen )
pdf? ( dev-python/python-poppler dev-python/pycairo dev-python/pdfrw )
gtk? ( dev-python/pygtk )"

PYTHON_MODNAME="MAT"

src_prepare() {
	sed -i "s#share/doc/${PN}#share/doc/${PF}#" setup.py
	use gtk || sed -i "s/'mat-gui'//" setup.py
	use gtk || sed -i "s/'mat-gui.1'//" setup.py
	use gtk || sed -i '/mat.desktop/d' setup.py
	use gtk || sed -i '/pixmaps/d' setup.py
}
