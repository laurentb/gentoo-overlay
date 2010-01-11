# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"

DESCRIPTION="lal is a clock for the dock. Nothing more, nothing less."
HOMEPAGE="http://projects.l3ib.org/lal/"
SRC_URI="http://projects.l3ib.org/lal/files/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_install()
{
	dobin lal
}
