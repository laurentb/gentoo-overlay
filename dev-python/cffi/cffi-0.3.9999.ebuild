# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
PYTHON_DEPEND="2:2.6 3:3.2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.5 3.1 2.5-jython"

inherit distutils

DESCRIPTION="Foreign Function Interface for Python calling C code."
HOMEPAGE="http://cffi.readthedocs.org/"
SRC_URI="https://bitbucket.org/${PN}/${PN}/get/69cddb87c25f70c01c1dfc6da27b85f6cade6fd7.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

S="${WORKDIR}/${PN}-${PN}-69cddb87c25f"

DEPEND="dev-libs/libffi
		dev-python/pycparser
		dev-python/pytest
		dev-python/hgdistver"
RDEPEND="${DEPEND}"

src_test() {
	testing() {
		PYTHONPATH="$(ls -d build-${PYTHON_ABI}/lib.*)" py.test c/ testing/ -x
	}
	python_execute_function testing
}
