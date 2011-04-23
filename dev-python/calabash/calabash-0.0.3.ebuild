# Copyright 2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=3
PYTHON_DEPEND="2:2.4"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Bash-style pipelining for Python generators."
HOMEPAGE="http://zacharyvoase.github.com/calabash/
https://github.com/dvxhouse/calabash
http://pypi.python.org/pypi/calabash"
SRC_URI="http://pypi.python.org/packages/source/c/${PN}/${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""
