# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit php-pear-lib-r1

if [ "$PV" == "9999" ]; then
	EGIT_REPO_URI="git://github.com/laurentb/symfony1.git https://github.com/laurentb/symfony1.git"
	EGIT_BRANCH="master"
	EGIT_HAS_SUBMODULES=1
	inherit git-2
	SRC_URI=""
elif [ "$PV" == "9998" ]; then
	EGIT_REPO_URI="git://github.com/LExpress/symfony1.git https://github.com/LExpress/symfony1.git"
	EGIT_BRANCH="1.4"
	inherit git-2
	SRC_URI=""
elif [ "$PV" == "9997" ]; then
	EGIT_REPO_URI="git://github.com/chok/symfony1.git https://github.com/chok/symfony1.git"
	EGIT_BRANCH="1.4"
	inherit git-2
	SRC_URI=""
elif [ "$PV" == "9996" ]; then
	EGIT_REPO_URI="git://github.com/symfony/symfony1.git https://github.com/symfony/symfony1.git"
	EGIT_BRANCH="1.4"
	inherit git-2
	SRC_URI=""
else
	SRC_URI="http://pear.symfony-project.com/get/${P}.tgz"
fi


DESCRIPTION="Open-source PHP5 web framework"
HOMEPAGE="http://www.symfony-project.com/"

LICENSE="MIT LGPL-2.1 BSD BSD-2 FDL-1.2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-lang/php[cli,ctype,session,simplexml,tokenizer,xml]
		|| ( <dev-lang/php-5.3[pcre,reflection,spl] >=dev-lang/php-5.3 )
		dev-php/pear"
RDEPEND="${DEPEND}"

src_prepare() {
	cd "${S}"
	if [ ! -f package.xml ]; then
		cp "${FILESDIR}/prerelease.php" "data/bin/"
		php data/bin/prerelease.php "${PV}"
	fi
}

pkg_postinst() {
	if has_version '=dev-lang/php-5*[-posix]';then
		einfo ""
		einfo "To enable color output on the symfony command line"
		einfo "add USE=\"posix\" to dev-lang/php"
		einfo ""
	fi
}
