# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=3
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit base distutils
EGIT_REPO_URI="git://github.com/hyde/typogrify.git
https://github.com/hyde/typogrify.git"
EGIT_BRANCH="hyde-setup"
inherit git-2

DESCRIPTION="typogrify: Filters to make web typography easier (hyde fork)"
HOMEPAGE="https://github.com/hyde/typogrify"
KEYWORDS="~amd64 ~x86"

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND=">=dev-python/smartypants-1.6.0.3
!dev-python/typogrify"
RDEPEND="${DEPEND}"

PYTHON_MODNAME="typogrify"

DOCS="INSTALL.txt LICENSE.txt README.markdown"
