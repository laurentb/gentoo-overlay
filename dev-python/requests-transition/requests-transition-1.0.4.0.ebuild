# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="2:2.6 3:3.1"
SUPPORT_PYTHON_ABIS="1"

# https://github.com/LuminosoInsight/python-requests-transition/issues/1
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Python HTTP for busy people who don't have time to resolve version
conflicts yet."
HOMEPAGE="http://pypi.python.org/pypi/requests-transition
https://github.com/LuminosoInsight/python-requests-transition"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

PYTHON_MODNAME="requests0 requests1"
