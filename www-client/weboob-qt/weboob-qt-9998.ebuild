# Copyright 2010-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )
PYTHON_REQ_USE="ssl"

EGIT_BRANCH="master"
if [[ ${PV} == *999* ]]; then
	[[ ${PV} == 9998 ]] && EGIT_BRANCH="stable"
	GIT_SCM=git-r3
	SRC_URI=""
else
	GITLAB_ID="88447995c486d6cc5828b30a1f650a35"
	SRC_URI="https://git.weboob.org/weboob/${PN}/uploads/${GITLAB_ID}/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

EGIT_REPO_URI="https://git.weboob.org/${PN}/${PN}.git"
inherit distutils-r1 xdg-utils ${GIT_SCM}
unset GIT_SCM

DESCRIPTION="Consume lots of websites without a browser (Web Outside Of Browsers)"
HOMEPAGE="http://weboob.org/"

LICENSE="LGPL-3+"
SLOT="0"

RDEPEND="
	$(python_gen_impl_dep 'ssl(+)')
	www-client/weboob[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	dev-python/PyQt5[multimedia,${PYTHON_USEDEP}]
"

src_prepare() {
	default
	rm -rf man/ weboob/__init__.py weboob/tools/__init__.py application/__init__.py weboob/applications/__init__.py
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	elog 'You should now run "weboob-config update" (as your login user).'
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
