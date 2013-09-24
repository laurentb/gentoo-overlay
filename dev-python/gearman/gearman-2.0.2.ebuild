# Copyright 2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="Gearman Python API - Client, worker, and admin client interfaces"
HOMEPAGE="https://github.com/Yelp/python-gearman
https://pypi.python.org/pypi/gearman"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

DOCS=( AUTHORS.txt CHANGES.txt LICENSE.txt README.txt TODO.txt docs/. )
