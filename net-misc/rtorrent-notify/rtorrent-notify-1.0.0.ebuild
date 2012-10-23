# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Notify of rtorrent events, through RSS or IRC"
HOMEPAGE="http://pypi.python.org/pypi/rtorrent-notify
http://git.p.engu.in/laurentb/rtorrent-notify/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="|| ( dev-lang/python:2.7 >=dev-python/argparse-1.1 )
dev-python/PyRSS2Gen"

DOCS="LICENSE README"
