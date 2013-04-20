# Copyright 2011-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="2:2.6 3:3.2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="A viewer for ReStructuredText documents that renders them on the fly."
HOMEPAGE="http://mg.pov.lt/restview/
http://pypi.python.org/pypi/restview"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+syntax"

DEPEND=""
RDEPEND="dev-python/docutils
syntax? ( dev-python/pygments )"
