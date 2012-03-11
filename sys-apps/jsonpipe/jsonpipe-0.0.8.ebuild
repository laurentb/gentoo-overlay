# Copyright 2011-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Convert JSON to a UNIX-friendly line-based format."
HOMEPAGE="https://github.com/dvxhouse/jsonpipe
http://pypi.python.org/pypi/jsonpipe"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-python/simplejson-2.1.3
|| ( dev-lang/python:2.7 >=dev-python/argparse-1.1 )
>=dev-python/calabash-0.0.3"
