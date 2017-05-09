# Copyright 2014-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

inherit python-r1
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DESCRIPTION="Pyramid common dependencies"
HOMEPAGE="http://www.pylonsproject.org/"
SRC_URI=""

LICENSE="repoze"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+development +mako"

RDEPEND="${DEPEND}
	dev-python/pyramid[${PYTHON_USEDEP}]
	dev-python/zope-deprecation[${PYTHON_USEDEP}]
	development? ( dev-python/waitress[${PYTHON_USEDEP}] )
	mako? ( dev-python/mako[${PYTHON_USEDEP}] )"
