# Copyright 2012-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_7,3_2,3_3} )

inherit linux-info distutils-r1

DESCRIPTION="Deduplication for Btrfs filesystems"
HOMEPAGE="https://pypi.python.org/pypi/bedup https://github.com/g2p/bedup"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-python/cffi-0.4.2[${PYTHON_USEDEP}]
>=sys-kernel/linux-headers-3.3
>=sys-libs/glibc-2.14
sys-fs/btrfs-progs"
RDEPEND="${DEPEND}
virtual/python-argparse[${PYTHON_USEDEP}]
dev-python/pyxdg[${PYTHON_USEDEP}]
dev-python/sqlalchemy[${PYTHON_USEDEP}]
dev-python/alembic[${PYTHON_USEDEP}]
dev-python/contextlib2[${PYTHON_USEDEP}]"

DOCS=( COPYING README.rst )

MINKV="3.3"

src_compile() {
	local CONFIG_CHECK="~BTRFS_FS"
	kernel_is -ge ${MINKV//./ } || ewarn "Kernel version at least ${MINKV} required"
	check_extra_config

	distutils-r1_src_compile
}
