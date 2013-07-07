# Copyright 2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS=1
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Implementation of per object permissions for Django"
HOMEPAGE="http://pypi.python.org/pypi/django-guardian"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
KEYWORDS="~amd64 ~x86"
IUSE=""

LICENSE="BSD"
SLOT="0"
PYTHON_MODNAME="guardian"

RDEPEND=">=dev-python/django-1.2"
DEPEND=""

DOCS="README.rst LICENSE CHANGES"
