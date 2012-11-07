# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit base distutils

DESCRIPTION="A single tool to manage your storage."
HOMEPAGE="http://storagemanager.sourceforge.net/
https://fedoraproject.org/wiki/Features/SystemStorageManager"
SRC_URI="mirror://sourceforge/storagemanager/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="virtual/python-argparse
sys-apps/util-linux
sys-apps/which"

PYTHON_MODNAME="ssmlib"
