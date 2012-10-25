# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"
RESTRICT="test"

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

distutils_src_compile_post_hook() {
	if use doc; then
		cd doc
		PYTHONPATH=.. emake html
	fi
}

distutils_src_install_post_hook() {
	if use examples ; then
		insinto /usr/share/${PF}/examples
		doins -r examples/*
	fi

	if use doc; then
		dohtml -r doc/_build/html/*
	fi
}

src_test() {
	testing() {
		"$(PYTHON)" tests/nosewrapper.py
	}
	python_execute_function testing
}
