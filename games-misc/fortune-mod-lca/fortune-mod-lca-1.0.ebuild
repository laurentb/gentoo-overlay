# Copyright 2010-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="Quotes from La Classe Américaine"
HOMEPAGE="http://cyclim.se/"
SRC_URI="http://stuff.laurent.bachelier.name/mirror/fortune-lca-${PV}.tar.bz2"

LICENSE="as-is"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd"
IUSE=""

DEPEND=""
RDEPEND="games-misc/fortune-mod"

S=${WORKDIR}

src_install() {
	insinto /usr/share/fortune
	doins laclasseamericaine laclasseamericaine.dat
}
