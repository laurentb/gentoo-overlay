# Copyright 2012-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Twisted Jabber support library"
HOMEPAGE="http://wokkel.ik.nu/
https://pypi.python.org/pypi/wokkel"
SRC_URI="http://wokkel.ik.nu/releases/${PV}/${P}.tar.gz
mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/python-dateutil[${PYTHON_USEDEP}]
dev-python/twisted-core[${PYTHON_USEDEP}]"
