# Copyright 2013-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Typography related template filters for Django & Jinja2"
HOMEPAGE="https://github.com/mintchaos/typogrify
https://pypi.python.org/pypi/typogrify"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=">=dev-python/smartypants-1.8[${PYTHON_USEDEP}]"

DOCS=( README.rst LICENSE.txt )
