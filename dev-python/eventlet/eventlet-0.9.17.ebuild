# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="A networking library that achieves high scalability by using non-blocking io"
HOMEPAGE="http://wiki.secondlife.com/wiki/Eventlet"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples test"

RDEPEND="dev-python/greenlet
	|| ( >=dev-lang/python-2.6 ( <dev-lang/python-2.6 dev-python/pyopenssl ) )"

DEPEND="${RDEPEND}
	dev-python/setuptools
	doc? ( dev-python/sphinx )
	test? (
		|| ( >=dev-lang/python-2.6 dev-python/simplejson )
		|| ( dev-lang/python[sqlite] dev-python/pysqlite )
		dev-python/nose )"

RESTRICT_PYTHON_ABIS="3*"
RESTRICT="test"

src_compile() {
	distutils_src_compile

	if use doc; then
		cd doc
		PYTHONPATH=.. emake html || die "Building docs failed"
	fi
}

src_install() {
	distutils_src_install
	if use examples ; then
		insinto /usr/share/${PF}/examples
		doins -r examples/* || die "Install failed"
	fi

	if use doc; then
		dohtml -r doc/_build/html/* || die "Error installing docs"
	fi
}

src_test() {
	testing() {
		"$(PYTHON)" tests/nosewrapper.py
	}
	python_execute_function testing
}
