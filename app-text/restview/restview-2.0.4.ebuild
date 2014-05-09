# Copyright 2011-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="A viewer for ReStructuredText documents that renders them on the fly."
HOMEPAGE="http://mg.pov.lt/restview/
https://pypi.python.org/pypi/restview"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/docutils[${PYTHON_USEDEP}]
dev-python/pygments[${PYTHON_USEDEP}]"
