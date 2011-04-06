# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils versionator

MY_P="${PN}-$(get_version_component_range 1-2)"
MY_P="${MY_P}-u$(get_version_component_range 3)"
MY_P="${MY_P}-b$(get_version_component_range 4)"
S="${WORKDIR}/${MY_P}"

DESCRIPTION="unix port of Monkey's Audio"
HOMEPAGE="http://supermmx.org/linux/mac/"
SRC_URI="http://supermmx.org/resources/linux/mac/${MY_P}.tar.gz
http://slackware.sukkology.net/packages/mac/${MY_P}.tar.gz"

LICENSE="unknown"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""
RESTRICT="nomirror"

DEPEND="x86? ( dev-lang/nasm )"
RDEPEND=""

src_prepare() {
	default
	epatch "${FILESDIR}"/mac-const.patch
}

src_install() {
	make DESTDIR=${D} install
	dodoc AUTHORS INSTALL NEWS README TODO COPYING
	dohtml ${S}/src/License.htm ${S}/src/Readme.htm
}
