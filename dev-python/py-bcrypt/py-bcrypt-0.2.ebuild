# Copyright 2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=3
PYTHON_DEPEND="*:2.4"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="py-bcrypt is an implementation the OpenBSD Blowfish password hashing algorithm"
HOMEPAGE="http://www.mindrot.org/projects/py-bcrypt"
SRC_URI="http://www.mindrot.org/files/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

DOCS="ChangeLog LICENSE README TODO"
