# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit autotools bash-completion

DESCRIPTION="A GTD, todo list, task management, command line utility"
HOMEPAGE="http://taskwarrior.org/"
SRC_URI="http://taskwarrior.org/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="vim-syntax zsh-completion +ncurses debug"

DEPEND="ncurses? ( sys-libs/ncurses )"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i 's/ -O3//' configure.ac || die "sed failed"
	eautoreconf
}

src_configure() {
	econf \
		$(use_with ncurses) \
		$(use_enable debug)
}

src_install() {
	emake DESTDIR="${D}" docdir="/trash" install \
		|| die "make install failed"
	# This is simpler than mangling the Makefile.
	rm -rf "${D}"/trash

	dodoc ChangeLog NEWS README README.build \
			AUTHORS COPYING || die "dodoc failed"
	docinto rc
	dodoc doc/rc/* || die "dodoc failed"
	docinto i18n
	dodoc i18n/* || die "dodoc failed"

	dobashcompletion scripts/bash/task_completion.sh ${PN}

	if use vim-syntax; then
		insinto /usr/share/vim/vimfiles/ftdetect
		doins scripts/vim/ftdetect/task.vim || die "doins ftdetect failed"
		insinto /usr/share/vim/vimfiles/syntax
		doins scripts/vim/syntax/*.vim || die "doins syntax failed"
		newdoc scripts/vim/README README.vim || die "newdoc failed"
	fi

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		doins scripts/zsh/_task || die "doins zsh failed"
	fi
}
