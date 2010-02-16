# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"

PHP_EXT_NAME="xhprof"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

inherit php-ext-source-r1

KEYWORDS="~amd64 ~x86"

DESCRIPTION="XHProf: A Hierarchical Profiler for PHP"
HOMEPAGE="http://pecl.php.net/package/xhprof"
SRC_URI="http://pecl.php.net/get/${P}.tgz"
LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

need_php_by_category

src_unpack() {
	unpack ${A}
	cd "${S}"
	mv "${S}/extension/"* "${S}/"
	php-ext-source-r1_phpize
}

src_install() {
	php-ext-source-r1_src_install
	dodoc-php CHANGELOG CREDITS LICENSE README

	php-ext-base-r1_addtoinifiles "xhprof.output_dir" '"/tmp/xhprof"'
}
