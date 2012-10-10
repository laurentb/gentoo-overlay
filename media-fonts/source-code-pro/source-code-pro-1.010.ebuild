# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
inherit font

MY_P=SourceCodePro_FontsOnly-${PV}

DESCRIPTION="Adobe Source Code Pro, a monospaced adaptation of Source Sans Pro"
HOMEPAGE="https://blogs.adobe.com/typblography/2012/09/source-code-pro.html"
SRC_URI="mirror://sourceforge/sourcecodepro.adobe/${MY_P}.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd"
IUSE=""

# This ebuild does not install any binaries
RESTRICT="binchecks strip"

RDEPEND="media-libs/fontconfig"
DEPEND="app-arch/unzip"

S=${WORKDIR}/${MY_P}

FONT_SUFFIX="otf ttf"
FONT_S=${S}
# From .spec of http://bugzilla.redhat.com/show_bug.cgi?id=845743
FONT_CONF=( "${FILESDIR}"/63-${PN}.conf )

src_prepare() {
	# Put otf and ttf files in one directory so that font_src_install can
	# actually find them
	mv -vf {OTF,TTF}/* . || die
}

src_install() {
	font_src_install
	dohtml *.html
}
