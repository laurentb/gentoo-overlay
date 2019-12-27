# Copyright 2012-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="A single tool to manage your storage."
HOMEPAGE="http://storagemanager.sourceforge.net/
https://fedoraproject.org/wiki/Features/SystemStorageManager"
SRC_URI="mirror://sourceforge/storagemanager/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="sys-apps/util-linux
sys-apps/which"
