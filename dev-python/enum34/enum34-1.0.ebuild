# Copyright 2013-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

inherit distutils-r1

DESCRIPTION="Python 3.4 Enum backported to older versions"
HOMEPAGE="https://pypi.python.org/pypi/enum34 https://bitbucket.org/stoneleaf/enum34"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="python_targets_python2_6? ( dev-python/ordereddict[python_targets_python2_6] )"

DOCS=( enum/doc/enum.rst enum/README enum/LICENSE )
