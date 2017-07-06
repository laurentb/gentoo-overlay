# Copyright 2010-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="git-publish-branch is a simple script to ease the unnecessarily \
complex task of \"publishing\" a branch"
HOMEPAGE="http://git-wt-commit.rubyforge.org/"
SRC_URI="http://gitorious.org/willgit/mainline/blobs/raw/165815e/bin/${PN} -> ${P} \
http://stuff.laurent.bachelier.name/mirror/${P}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

DEPEND=""
RDEPEND="dev-vcs/git
dev-lang/ruby"

S="${WORKDIR}"

src_unpack() {
	cp "${DISTDIR}/${P}" "${WORKDIR}/${PN}"
}

src_install() {
	exeinto "/usr/libexec/git-core/"
	doexe ${PN}
}
