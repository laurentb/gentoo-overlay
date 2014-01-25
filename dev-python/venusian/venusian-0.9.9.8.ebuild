# Copyright 2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

inherit distutils-r1

MY_PV="${PV/0.9.9./1.0a}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="A library for deferring decorator actions"
HOMEPAGE="http://docs.pylonsproject.org/projects/venusian/ https://pypi.python.org/pypi/venusian"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="repoze"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${MY_P}"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""
