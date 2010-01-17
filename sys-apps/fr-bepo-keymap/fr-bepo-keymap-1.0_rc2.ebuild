# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"

DESCRIPTION="Bépo keymap for the Linux Console"
HOMEPAGE="http://bepo.fr/"
LICENSE="CCPL-Attribution-ShareAlike-3.0" # Also GFDL

SRC_URI="http://download.tuxfamily.org/dvorak/keymaps/fr-dvorak-bepo-keymaps-${PV/_}.tgz"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE=""

RDEPEND="
	sys-apps/kbd
"

S="${WORKDIR}/fr-dvorak-bepo-keymaps-${PV/_}"

src_compile() {
	gzip fr-dvorak-bepo.map
	gzip fr-dvorak-bepo-utf8.map
}

src_install() {
	local KEYMAPS_DIR="/usr/share/keymaps/i386/dvorak/"
	insinto "${KEYMAPS_DIR}"
	doins fr-dvorak-bepo.map.gz fr-dvorak-bepo-utf8.map.gz

	dodoc LISEZ_MOI.txt GFDL.txt CC-SA-BY.txt
}

pkg_postinst() {
	elog "To try out bépo, start \"loadkeys fr-dvorak-bepo\"."
	elog "To use bépo permanently, add KEYMAP=\"fr-dvorak-bepo\""
	elog "to /etc/conf.d/keymaps."
}

