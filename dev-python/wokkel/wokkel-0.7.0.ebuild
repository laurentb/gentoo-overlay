# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Twisted Jabber support library"
HOMEPAGE="http://wokkel.ik.nu/ http://pypi.python.org/pypi/wokkel"
SRC_URI="http://wokkel.ik.nu/releases/${PV}/${P}.tar.gz mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/python-dateutil
>=dev-python/twisted-10.0.0"
