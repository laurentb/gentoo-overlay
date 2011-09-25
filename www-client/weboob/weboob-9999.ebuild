# Copyright 2010-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=3
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit base distutils
[ "$PV" == "9999" ] \
	&& EGIT_REPO_URI="git://git.symlink.me/pub/romain/${PN}.git" \
	&& inherit git-2
[ "$PV" == "9998" ] \
	&& EGIT_REPO_URI="git://git.symlink.me/pub/romain/${PN}-stable.git" \
	&& inherit git-2

DESCRIPTION="Weboob (Web Out Of Browsers) provides several applications to interact with a lot of websites."
HOMEPAGE="http://weboob.org/"
SRC_URI=""

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="X"

DEPEND="dev-python/prettytable
	dev-python/html2text
	dev-python/mechanize
	dev-python/python-dateutil
	dev-python/html5lib
	dev-python/lxml
	dev-python/pyyaml
	dev-python/imaging
	dev-python/gdata
	dev-python/feedparser
	X? ( dev-python/PyQt4[X] dev-python/pyxdg )
	|| ( dev-lang/python:2.7 dev-lang/python:2.6 dev-python/simplejson )"
RDEPEND="${DEPEND}"

DOCS="AUTHORS COPYING ChangeLog README INSTALL"

set_global_options() {
	local qtopt="--no-qt" && xdgopt="--no-xdg"
	use X && qtopt="--qt" && xdgopt="--xdg"
	DISTUTILS_GLOBAL_OPTIONS=($qtopt $xdgopt)
}

src_compile() {
	set_global_options
	distutils_src_compile
}

src_install() {
	set_global_options
	distutils_src_install
}
