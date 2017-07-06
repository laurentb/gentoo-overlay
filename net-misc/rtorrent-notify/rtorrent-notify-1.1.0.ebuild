# Copyright 2012-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Notify of rtorrent events, through RSS or IRC"
HOMEPAGE="https://pypi.python.org/pypi/rtorrent-notify
http://git.p.engu.in/laurentb/rtorrent-notify/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/PyRSS2Gen[${PYTHON_USEDEP}]"

DOCS=( LICENSE README )
