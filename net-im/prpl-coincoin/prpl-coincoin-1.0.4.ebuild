# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="3"

inherit cmake-utils eutils

DESCRIPTION="coincoin plugin for libpurple"
HOMEPAGE="http://symlink.me/projects/minbif/wiki/CoinCoin"
SRC_URI="http://symlink.me/attachments/download/90/minbif-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-im/pidgin-2.6.3
	>=dev-libs/libxml2-2.5.0
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/minbif-${PV}"

src_configure() {
	local mycmakeargs
	mycmakeargs="${mycmakeargs}
		-DCONF_PREFIX=${PREFIX:-/etc/minbif}
		-DENABLE_MINBIF=OFF
		-DENABLE_PLUGIN=ON
		-DENABLE_PLUGIN_COINCOIN=ON
		-DENABLE_PLUGIN_GAYATTITUDE=OFF
	"

	cmake-utils_src_configure
}

src_install() {
	dodoc plugins/coincoin/README
	dodoc AUTHORS COPYING ChangeLog

	cmake-utils_src_install

	echo
	elog "\_o<"
	echo
}

