# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"

DESCRIPTION="git-wtf is a script to display the state of your repository in a \
readable and easy-to-scan format."
HOMEPAGE="http://git-wt-commit.rubyforge.org/"
SRC_URI="http://gitorious.org/willgit/mainline/blobs/raw/7c9cccb/bin/${PN} -> ${P} \
http://stuff.laurent.bachelier.name/mirror/${P}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
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
