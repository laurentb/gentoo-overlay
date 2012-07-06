# Copyright 2011-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="py-bcrypt is an implementation of the OpenBSD Blowfish password hashing algorithm"
HOMEPAGE="http://www.mindrot.org/projects/py-bcrypt
https://code.google.com/p/py-bcrypt/"
SRC_URI="http://www.mindrot.org/files/${PN}/${P}.tar.gz
http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="BSD-4"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

DOCS="ChangeLog LICENSE README TODO"
