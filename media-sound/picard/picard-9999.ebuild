# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="3"

PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit eutils distutils

DESCRIPTION="An improved rewrite/port of the Picard Tagger using Qt"
HOMEPAGE="http://musicbrainz.org/doc/PicardQt"
SRC_URI=""
EGIT_REPO_URI="git://github.com/musicbrainz/picard.git"
inherit git-2

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="cdda acoustid amplifind nls"

DEPEND="
	dev-python/PyQt4[X]
	media-libs/mutagen
	cdda? ( >=media-libs/libdiscid-0.1.1 )
	acoustid? ( media-libs/chromaprint[tools] )
	amplifind? (
		virtual/ffmpeg
		>=media-libs/libofa-0.9.2 )"
RDEPEND="${DEPEND}"

# doesn't work with ebuilds
RESTRICT="test"

S="${WORKDIR}/${MY_P}"

DOCS="AUTHORS.txt INSTALL.txt NEWS.txt"

pkg_setup() {
	if ! use acoustid && ! use amplifind; then
		ewarn "The 'acoustid' and 'amplifind' USE flags are disabled."
		ewarn "Acoustic fingerprinting and recognition will not be available."
		ewarn "Enabling 'acoustid' is recommended."
	fi
	if ! use cdda; then
		ewarn "The 'cdda' USE flag is disabled. CD index lookup and"
		ewarn "identification will not be available. You can get audio CD support"
		ewarn "by installing media-libs/libdiscid."
	fi
}

src_configure() {
	$(PYTHON -f) setup.py config || die "setup.py config failed"
	if ! use amplifind; then
		sed -i -e "s:\(^with-avcodec\ =\ \).*:\1False:" \
			-e "s:\(^with-libofa\ =\ \).*:\1False:" \
			build.cfg || die "sed failed"
	fi
}

src_compile() {
	distutils_src_compile $(use nls || echo "--disable-locales")
}

src_install() {
	distutils_src_install --disable-autoupdate --skip-build \
		$(use nls || echo "--disable-locales")

	doicon picard.ico || die 'doicon failed'
	domenu picard.desktop || die 'domenu failed'
}

pkg_postinst() {
	distutils_pkg_postinst
	echo
	ewarn "If you are upgrading Picard and it does not start"
	ewarn "try removing Picard's settings:"
	ewarn "	rm ~/.config/MusicBrainz/Picard.conf"
	elog
	elog "You should set the environment variable BROWSER to something like"
	elog "\"firefox '%s' &\" to let python know which browser to use."
}
