# Copyright 2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

inherit distutils-r1

DESCRIPTION="BLAKE2 hash function extension module"
HOMEPAGE="https://pypi.python.org/pypi/pyblake2
https://github.com/dchest/pyblake2"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cpu_flags_x86_avx cpu_flags_x86_sse2 cpu_flags_x86_ssse3 cpu_flags_x86_xop"

DEPEND=""
RDEPEND=""

src_prepare() {
	default

	use cpu_flags_x86_sse2 \
		&& sed -i "s/#opt_version = 'BLAKE2_COMPRESS_SSE2'/opt_version = 'BLAKE2_COMPRESS_SSE2'/" setup.py
	use cpu_flags_x86_ssse3 \
		&& sed -i "s/#opt_version = 'BLAKE2_COMPRESS_SSSE3'/opt_version = 'BLAKE2_COMPRESS_SSSE3'/" setup.py
	use cpu_flags_x86_avx \
		&& sed -i "s/#opt_version = 'BLAKE2_COMPRESS_AVX'/opt_version = 'BLAKE2_COMPRESS_AVX'/" setup.py
	use cpu_flags_x86_xop \
		&& sed -i "s/#opt_version = 'BLAKE2_COMPRESS_XOP'/opt_version = 'BLAKE2_COMPRESS_XOP'/" setup.py
}

DOCS=( COPYING README.rst )
