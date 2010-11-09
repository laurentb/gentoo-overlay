# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit distutils
[ "$PV" == "9999" ] && inherit git
PYTHON_DEPEND="2:2.5"

DESCRIPTION="Web Out of Browsers"
HOMEPAGE="http://weboob.org/"
SRC_URI=""
EGIT_BRANCH="master"
EGIT_REPO_URI="git://git.symlink.me/pub/romain/weboob.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

