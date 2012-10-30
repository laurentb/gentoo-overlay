# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit base distutils
if [ "$PV" == "9999" ]; then
	EGIT_REPO_URI="git://github.com/lakshmivyas/${PN}.git
	https://github.com/lakshmivyas/${PN}.git"
	inherit git-2
fi

DESCRIPTION="A declarative interface for argparse"
HOMEPAGE="http://github.com/lakshmivyas/commando
http://pypi.python.org/pypi/commando"
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

DEPEND=""
RDEPEND="virtual/python-argparse"

DOCS="LICENSE README.markdown"

PYTHON_MODNAME="${PN}.py"
