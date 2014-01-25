# Copyright 2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

inherit distutils-r1

DESCRIPTION="Pyramid web application development framework"
HOMEPAGE="http://www.pylonsproject.org/ https://pypi.python.org/pypi/pyramid"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="repoze"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+development"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}
	dev-python/chameleon[${PYTHON_USEDEP}]
	dev-python/mako[${PYTHON_USEDEP}]
	dev-python/pastedeploy[${PYTHON_USEDEP}]
	dev-python/repoze-lru[${PYTHON_USEDEP}]
	dev-python/translationstring[${PYTHON_USEDEP}]
	dev-python/venusian[${PYTHON_USEDEP}]
	dev-python/webob[${PYTHON_USEDEP}]
	net-zope/zope-deprecation[${PYTHON_USEDEP}]
	net-zope/zope-interface[${PYTHON_USEDEP}]
	development? ( dev-python/waitress[${PYTHON_USEDEP}] )"
