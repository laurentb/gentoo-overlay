# Copyright 2010-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 gnome2-utils

if [ "$PV" == "9999" ]; then
	EGIT_REPO_URI="git://git.symlink.me/pub/${PN}/devel.git"
	inherit git-r3
	KEYWORDS=""
	SRC_URI=""
elif [ "$PV" == "9998" ]; then
	EGIT_REPO_URI="git://git.symlink.me/pub/${PN}/stable.git"
	inherit git-r3
	KEYWORDS=""
	SRC_URI=""
else
	KEYWORDS="~x86 ~amd64"
	REDMINE_ID="324"
	SRC_URI="https://symlink.me/attachments/download/${REDMINE_ID}/${P}.tar.gz"
fi

DESCRIPTION="Weboob (Web Outside of Browsers) provides several applications to interact with a lot of websites."
HOMEPAGE="http://weboob.org/"

LICENSE="AGPL-3"
SLOT="0"
IUSE="X +secure-updates +sni fast-libs"

DEPEND="X? ( >=dev-python/PyQt4-4.9.4-r1[X,phonon,${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}
	dev-python/prettytable[${PYTHON_USEDEP}]
	dev-python/html2text[${PYTHON_USEDEP}]
	dev-python/mechanize[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/gdata[${PYTHON_USEDEP}]
	dev-python/feedparser[${PYTHON_USEDEP}]
	dev-python/termcolor[${PYTHON_USEDEP}]
	secure-updates? ( app-crypt/gnupg )
	fast-libs? (
		dev-python/simplejson[${PYTHON_USEDEP}]
		dev-python/pyyaml[libyaml,${PYTHON_USEDEP}]
	)
	>=dev-python/lxml-3.0[${PYTHON_USEDEP}]
	dev-python/cssselect[${PYTHON_USEDEP}]
	>=dev-python/requests-2.2[${PYTHON_USEDEP}]
	sni? ( >=dev-lang/python-2.7.9 )
	virtual/python-futures[${PYTHON_USEDEP}]"

DOCS=( AUTHORS COPYING ChangeLog README INSTALL )

python_configure_all() {
	mydistutilsargs=(
		$(usex X '--qt' '--no-qt')
		$(usex X '--xdg' '--no-xdg')
	)
}

python_install_all() {
	distutils-r1_python_install_all
	insinto /usr/share/${PN}/
	doins -r contrib
}

pkg_preinst() {
	use X && gnome2_icon_savelist
}

pkg_postinst() {
	use X && gnome2_icon_cache_update
	elog 'You should now run "weboob-config update" (as your login user).'
}

pkg_postrm() {
	use X && gnome2_icon_cache_update
}