# Copyright 2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit base

DESCRIPTION=""
HOMEPAGE="http://git.p.engu.in/laurentb/tmpclone/"
SRC_URI="http://git.p.engu.in/laurentb/${PN}/snapshot/${P}.tar.bz2"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-vcs/git"

DOCS=(README)
