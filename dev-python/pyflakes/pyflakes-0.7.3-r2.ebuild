# Copyright 1999-2013 Gentoo Foundation

EAPI=5
PYTHON_COMPAT=(python{2_6,2_7,3_2,3_3} )

inherit distutils-r1

DESCRIPTION="Passive checker for Python programs"
HOMEPAGE="https://launchpad.net/pyflakes https://pypi.python.org/pypi/pyflakes"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

DOCS=( AUTHORS NEWS.txt README.rst )

python_test() {
	esetup.py test --quiet
}

src_prepare () {
	epatch "${FILESDIR}/fix-doctest.patch"
	epatch "${FILESDIR}/sanitize-python2-check.patch"
}
