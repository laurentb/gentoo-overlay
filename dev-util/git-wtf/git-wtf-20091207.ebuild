# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="http://git-wt-commit.rubyforge.org/git-wtf -> ${P} \
http://stuff.laurent.bachelier.name/mirror/${P}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="dev-util/git
dev-lang/ruby"

src_unpack()
{
	cp ${DISTDIR}/${P} ${WORKDIR}/${PN}
}

src_install()
{
	exeinto "/usr/libexec/git-core/"
	doexe ${PN}
}
