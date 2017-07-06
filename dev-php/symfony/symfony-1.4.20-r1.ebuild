# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit php-pear-r1

if [ "$PV" == "9999" ]; then
	EGIT_REPO_URI="git://github.com/laurentb/symfony1.git https://github.com/laurentb/symfony1.git"
	EGIT_BRANCH="master"
	inherit git-r3
	SRC_URI=""
elif [ "$PV" == "9998" ]; then
	EGIT_REPO_URI="git://github.com/LExpress/symfony1.git https://github.com/LExpress/symfony1.git"
	EGIT_BRANCH="1.4"
	inherit git-r3
	SRC_URI=""
elif [ "$PV" == "9997" ]; then
	EGIT_REPO_URI="git://github.com/chok/symfony1.git https://github.com/chok/symfony1.git"
	EGIT_BRANCH="1.4"
	inherit git-r3
	SRC_URI=""
elif [ "$PV" == "9996" ]; then
	EGIT_REPO_URI="git://github.com/symfony/symfony1.git https://github.com/symfony/symfony1.git"
	EGIT_BRANCH="1.4"
	inherit git-r3
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

DEPEND="dev-lang/php:*[cli,ctype,posix,session,simplexml,tokenizer,xml]"
RDEPEND="${DEPEND}"

src_prepare() {
	default

	cd "${S}"
	if [ ! -f package.xml ]; then
		cp "${FILESDIR}/prerelease.php" "data/bin/"
		php data/bin/prerelease.php "${PV}"
	fi
}
