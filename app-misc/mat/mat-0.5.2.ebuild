# Copyright 2012-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="Metadata Anonymisation Toolkit"
HOMEPAGE="https://mat.boum.org/"
SRC_URI="https://mat.boum.org/files/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+exif +audio +pdf gtk"

DEPEND="dev-python/python-distutils-extra[${PYTHON_USEDEP}]
dev-python/hachoir-core[${PYTHON_USEDEP}]
dev-python/hachoir-parser"
RDEPEND="${DEPEND}
exif? ( media-libs/exiftool )
audio? ( media-libs/mutagen[${PYTHON_USEDEP}] )
pdf? ( dev-python/python-poppler[${PYTHON_USEDEP}] dev-python/pycairo[${PYTHON_USEDEP}] dev-python/pdfrw[${PYTHON_USEDEP}] )
gtk? ( dev-python/pygtk[${PYTHON_USEDEP}] )
dev-python/pygobject:3"

src_prepare() {
	sed -i "s#share/doc/${PN}#share/doc/${PF}#" setup.py
	use gtk || sed -i "s/'mat-gui'//" setup.py
	use gtk || sed -i "s/'mat-gui.1'//" setup.py
	use gtk || sed -i '/mat.desktop/d' setup.py
	use gtk || sed -i '/pixmaps/d' setup.py
	use gtk || sed -i '/nautilus/d' setup.py
}
