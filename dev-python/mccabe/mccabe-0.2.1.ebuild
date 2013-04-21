# Copyright 2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="2:2.5 3:3.1"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="McCabe checker, plugin for flake8"
HOMEPAGE="https://pypi.python.org/pypi/mccabe"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# setuptools required RDEPEND for extensions
DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}"
