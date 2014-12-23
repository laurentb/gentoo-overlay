# Copyright 2012-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="A single tool to manage your storage."
HOMEPAGE="http://storagemanager.sourceforge.net/
https://fedoraproject.org/wiki/Features/SystemStorageManager"
SRC_URI="mirror://sourceforge/storagemanager/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="sys-apps/util-linux
sys-apps/which"
