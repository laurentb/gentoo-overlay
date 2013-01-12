# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="2:2.5 3:3.1"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

FIX="-fix"
DESCRIPTION=""
HOMEPAGE="https://github.com/docopt/docopts
http://pypi.python.org/pypi/docopts"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}${FIX}.tar.gz"

S="${WORKDIR}/${P}${FIX}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/docopt"
