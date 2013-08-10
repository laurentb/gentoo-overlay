# Copyright 2011-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_5,2_6,2_7} )

inherit distutils-r1

DESCRIPTION="Bash-style pipelining for Python generators."
HOMEPAGE="http://zacharyvoase.github.io/calabash/
https://github.com/zacharyvoase/calabash
https://pypi.python.org/pypi/calabash"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""
