# Copyright 2011-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1
[ "$PV" == "9999" ] \
	&& EGIT_REPO_URI="git://git.symlink.me/pub/laurentb/${PN}.git" \
	&& inherit git-2

DESCRIPTION="The Asocial Sharing Network"
HOMEPAGE="http://assnet.org/"
SRC_URI=""

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/webob[${PYTHON_USEDEP}]
	dev-python/paste[${PYTHON_USEDEP}]
	dev-python/mako[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/PyRSS2Gen[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]"

DOCS=( COPYING README.rst SETUP.rst )
