# Copyright 2013-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit base

DESCRIPTION="Clone a SCM repo (git) temporarily"
HOMEPAGE="http://git.p.engu.in/laurentb/tmpclone/"
SRC_URI="http://git.p.engu.in/laurentb/${PN}/snapshot/${P}.tar.xz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-vcs/git"

DOCS=(README)
