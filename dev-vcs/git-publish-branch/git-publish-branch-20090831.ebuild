# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"

DESCRIPTION="git-publish-branch is a simple script to ease the unnecessarily \
complex task of \"publishing\" a branch, i.e., taking a local branch, \
creating a reference to it on a remote repo, and setting up the local \
branch to track the remote one, all in one go."
HOMEPAGE="http://git-wt-commit.rubyforge.org/"
SRC_URI="http://gitorious.org/willgit/mainline/blobs/raw/165815e/bin/${PN} -> ${P} \
http://stuff.laurent.bachelier.name/mirror/${P}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-vcs/git
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
