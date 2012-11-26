# Copyright 2011-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit base distutils
[ "$PV" == "9999" ] \
	&& EGIT_REPO_URI="git://git.symlink.me/pub/laurentb/${PN}.git" \
	&& inherit git-2

DESCRIPTION="Authenticated Social Storage Made for Mothers"
HOMEPAGE="http://ass2m.org/"
SRC_URI=""

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="dev-python/webob
	virtual/python-argparse
	dev-python/paste
	dev-python/mako
	dev-python/imaging
	dev-python/PyRSS2Gen
	dev-python/python-dateutil"

DOCS="COPYING README.rst SETUP.rst"
