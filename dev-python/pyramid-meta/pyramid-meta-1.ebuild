# Copyright 2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_2,3_3,3_4} )

inherit python-r1

DESCRIPTION="Pyramid common dependencies"
HOMEPAGE="http://www.pylonsproject.org/"
SRC_URI=""

LICENSE="repoze"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+development +mako"

RDEPEND="${DEPEND}
	dev-python/pyramid[${PYTHON_USEDEP}]
	net-zope/zope-deprecation[${PYTHON_USEDEP}]
	development? ( dev-python/waitress[${PYTHON_USEDEP}] )
	mako? ( dev-python/mako[${PYTHON_USEDEP}] )"
