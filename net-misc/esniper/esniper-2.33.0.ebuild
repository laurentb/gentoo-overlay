# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit versionator

MY_P=${PN}-$(replace_all_version_separators '-')
DESCRIPTION="A simple, lightweight tool for sniping ebay auctions"
HOMEPAGE="http://esniper.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tgz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/openssl
	>=net-misc/curl-7.12[ssl]"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

src_install() {
	emake DESTDIR="${D}" install
	dobin frontends/snipe
	dodoc AUTHORS ChangeLog NEWS README TODO sample_auction.txt sample_config.txt
}

pkg_postinst() {
	elog
	elog "Please find a sample config in /usr/share/doc/${P}/"
	elog
}
