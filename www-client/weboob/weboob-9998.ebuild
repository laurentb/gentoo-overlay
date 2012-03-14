# Copyright 2010-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit base distutils
if [ "$PV" == "9999" ]; then
	EGIT_REPO_URI="git://git.symlink.me/pub/romain/${PN}.git"
	inherit git-2
	KEYWORDS=""
	SRC_URI=""
elif [ "$PV" == "9998" ]; then
	EGIT_REPO_URI="git://git.symlink.me/pub/romain/${PN}-stable.git"
	inherit git-2
	KEYWORDS=""
	SRC_URI=""
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="http://symlink.me/attachments/download/169/${PN}-0.b.tar.gz"
	S="${WORKDIR}/${PN}-0.b"
fi


DESCRIPTION="Weboob (Web Out of Browsers) provides several applications to interact with a lot of websites."
HOMEPAGE="http://weboob.org/"

LICENSE="AGPL-3"
SLOT="0"
IUSE="X +secure-updates"

DEPEND="X? ( dev-python/PyQt4[X] dev-python/pyxdg )"
RDEPEND="${DEPEND}
	dev-python/prettytable
	dev-python/html2text
	dev-python/mechanize
	dev-python/python-dateutil
	dev-python/lxml
	dev-python/pyyaml
	dev-python/imaging
	dev-python/gdata
	dev-python/feedparser
	secure-updates? ( app-crypt/gnupg )
	|| ( dev-lang/python:2.7 dev-lang/python:2.6 dev-python/simplejson )"

DOCS="AUTHORS COPYING ChangeLog README INSTALL"

set_global_options() {
	local xopt=$(use X && echo "" || echo "no-")
	DISTUTILS_GLOBAL_OPTIONS=("* --${xopt}qt" "* --${xopt}xdg")
}

distutils_src_install_pre_hook() {
	set_global_options
}

distutils_src_compile_pre_hook() {
	set_global_options
}

pkg_postinst() {
	elog "You should now run \"weboob-config update\" (as your login user)."
}
