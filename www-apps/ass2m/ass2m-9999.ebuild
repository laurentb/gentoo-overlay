# Copyright 2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=3
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils
[ "$PV" == "9999" ] && inherit git

DESCRIPTION="Authenticated Social Storage Made for Mothers"
HOMEPAGE="http://ass2m.org/"
SRC_URI=""
[ "$PV" == "9999" ] && EGIT_REPO_URI="git://git.symlink.me/pub/laurentb/ass2m.git"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-python/webob
	|| ( dev-lang/python:2.7 dev-python/argparse )
	dev-python/paste
	dev-python/mako
	dev-python/imaging
	dev-python/PyRSS2Gen
	dev-python/python-dateutil"
RDEPEND="${DEPEND}"

DOCS="COPYING"
