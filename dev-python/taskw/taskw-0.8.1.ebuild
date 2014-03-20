# Copyright 2012-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

inherit distutils-r1

DESCRIPTION="Python bindings for your taskwarrior database"
HOMEPAGE="https://pypi.python.org/pypi/taskw
https://github.com/ralphbean/taskw"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="app-misc/task
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	python_targets_python2_6? ( dev-python/ordereddict[python_targets_python2_6] )"

DOCS=( README.rst LICENSE.txt )
