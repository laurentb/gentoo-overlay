# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit cmake-utils eutils

DESCRIPTION="coincoin plugin for libpurple"
HOMEPAGE="http://symlink.me/projects/minbif/wiki/CoinCoin"
SRC_URI="http://symlink.me/attachments/download/50/minbif-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-im/pidgin-2.6.3
	>=dev-libs/libxml2-2.5.0
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/minbif-${PV}"

src_prepare() {
	# make the build *really modular*
	epatch "${FILESDIR}"/fix-build-plugins-only.patch

	sed -i "/gayattitude/ d" \
		plugins/CMakeLists.txt || die "sed failed"
}

src_configure() {
	local mycmakeargs
	mycmakeargs="${mycmakeargs}
		-DCONF_PREFIX=${PREFIX:-/etc/minbif}
		-DENABLE_MINBIF=OFF
		-DENABLE_PLUGIN=ON
	"

	cmake-utils_src_configure
}

src_install() {
	dodoc plugins/coincoin/README
	dodoc AUTHORS COPYING ChangeLog

	cmake-utils_src_install
}

