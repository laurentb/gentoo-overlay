# Copyright 2012-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

inherit distutils-r1

MY_PN="Unipath"
MY_P="${MY_PN}-${PV}"
S="${WORKDIR}/${MY_P}"

DESCRIPTION="Object-oriented alternative to os/os.path/shutil"
HOMEPAGE="http://sluggo.scrapping.cc/python/unipath/
https://pypi.python.org/pypi/Unipath"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz
http://sluggo.scrapping.cc/python/unipath/${MY_P}.tar.gz"

LICENSE="PSF-2.4"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

DOCS=( README.rst README.html CHANGES BUGS.txt )
