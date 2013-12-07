# Copyright 2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

inherit distutils-r1

DESCRIPTION="Python library and command-line tool to sort lists naturally"
HOMEPAGE="https://pypi.python.org/pypi/natsort
https://github.com/SethMMorton/natsort"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="virtual/python-argparse[${PYTHON_USEDEP}]"

DOCS=( README.rst LICENSE )
