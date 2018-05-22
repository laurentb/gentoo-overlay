# Copyright 2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

inherit distutils-r1

DESCRIPTION="Python wrapper for Stanford CoreNLP"
HOMEPAGE="https://github.com/Lynten/stanford-corenlp
https://pypi.org/project/stanfordcorenlp"
SRC_URI="https://github.com/Lynten/stanford-corenlp/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~x86"

LICENSE="MIT"
SLOT="0"
IUSE=""

S="${WORKDIR}/stanford-corenlp-${PV}"

DEPEND=""
RDEPEND="dev-python/psutil
	dev-python/requests"

DOCS=( README.md LICENSE )
