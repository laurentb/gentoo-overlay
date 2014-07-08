# Copyright 2012-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

if [ "$PV" == "9999" ]; then
	EGIT_REPO_URI="git://github.com/lakshmivyas/${PN}.git
	https://github.com/lakshmivyas/${PN}.git"
	inherit git-2
fi

DESCRIPTION="A declarative interface for argparse"
HOMEPAGE="https://github.com/lakshmivyas/commando
https://pypi.python.org/pypi/commando"
if [ "$PV" != "9999" ]; then
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
else
	SRC_URI=""
	KEYWORDS=""
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""

DOCS=( LICENSE AUTHORS.rst CHANGELOG.rst CONTRIBUTING.rst README.rst )
