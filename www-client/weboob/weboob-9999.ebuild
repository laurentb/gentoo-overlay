# Copyright 2010-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit base distutils gnome2-utils
if [ "$PV" == "9999" ]; then
	EGIT_REPO_URI="git://git.symlink.me/pub/${PN}/devel.git"
	inherit git-2
	KEYWORDS=""
	SRC_URI=""
elif [ "$PV" == "9998" ]; then
	EGIT_REPO_URI="git://git.symlink.me/pub/${PN}/stable.git"
	inherit git-2
	KEYWORDS=""
	SRC_URI=""
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="http://symlink.me/attachments/download/229/${PN}-0.g.tar.gz"
	S="${WORKDIR}/${PN}-0.g"
fi


DESCRIPTION="Weboob (Web Outside of Browsers) provides several applications to interact with a lot of websites."
HOMEPAGE="http://weboob.org/"

LICENSE="AGPL-3"
SLOT="0"
IUSE="X +secure-updates fast-libs"

DEPEND="X? ( >=dev-python/PyQt4-4.9.4-r1[X,phonon] )
	dev-python/setuptools"
RDEPEND="${DEPEND}
	dev-python/prettytable
	dev-python/html2text
	dev-python/mechanize
	dev-python/python-dateutil
	dev-python/pyyaml
	virtual/python-imaging
	dev-python/gdata
	dev-python/feedparser
	dev-python/termcolor
	secure-updates? ( app-crypt/gnupg )
	fast-libs? ( dev-python/simplejson dev-python/pyyaml[libyaml] )
	virtual/python-json
	|| ( ( <dev-python/lxml-3.0 ) ( >=dev-python/lxml-3.0 dev-python/cssselect ) )"

DOCS="AUTHORS COPYING ChangeLog README INSTALL"

set_global_options() {
	DISTUTILS_GLOBAL_OPTIONS=("* --$(usex X '' 'no-')qt" "* --$(usex X '' 'no-')xdg")
}

distutils_src_install_post_hook() {
	insinto /usr/share/${PN}/
	doins -r contrib/*
}

distutils_src_compile_pre_hook() {
	set_global_options
}

pkg_preinst() {
	distutils_pkg_preinst
	USE X && gnome2_icon_savelist
}

pkg_postinst() {
	distutils_pkg_postinst
	USE X && gnome2_icon_cache_update
	elog "You should now run \"weboob-config update\" (as your login user)."
}

pkg_postrm() {
	distutils_pkg_postrm
	use X && gnome2_icon_cache_update
}
