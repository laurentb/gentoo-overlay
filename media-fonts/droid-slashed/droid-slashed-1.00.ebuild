# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"

inherit font

DESCRIPTION="Droid Sans Mono (w/ slashed zero)"
HOMEPAGE="http://cosmix.org/software/"
SRC_URI="http://stuff.laurent.bachelier.name/mirror/DroidSansMonoSlashed-${PV}.zip
http://www.cosmix.org/software/files/DroidSansMonoSlashed.zip ->
DroidSansMonoSlashed-${PV}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86"
IUSE=""

S=${WORKDIR}
FONT_S=${WORKDIR}
FONT_SUFFIX="ttf"

RDEPEND=""
DEPEND=""
