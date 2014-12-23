# Copyright 2013-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="The simplest way to write one program that runs on both Python 2 and Python 3"
HOMEPAGE="https://pypi.python.org/pypi/pies
https://github.com/timothycrosley/pies"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="
$(python_gen_cond_dep 'dev-python/pies2overrides[${PYTHON_USEDEP}]' python2_7)
$(python_gen_cond_dep 'dev-python/enum34[${PYTHON_USEDEP}]' python{2_7,3_3})"
