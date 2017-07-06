# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit eutils python-single-r1

DESCRIPTION="Proximity detector for your mobile phone via bluetooth"
HOMEPAGE="http://blueproximity.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

IUSE=""

MY_AVAILABLE_LINGUAS="de en es fa hu it ru sv th"
IUSE="${IUSE} ${MY_AVAILABLE_LINGUAS// / linguas_}"

SLOT="0"

LICENSE="GPL-2"

KEYWORDS="~x86 ~amd64"

DEPEND=""
RDEPEND="dev-python/pygobject[${PYTHON_USEDEP}]
	dev-python/configobj[${PYTHON_USEDEP}]
	dev-python/pybluez[${PYTHON_USEDEP}]
	>=dev-python/pygtk-2.0[${PYTHON_USEDEP}]"

S="${WORKDIR}/${P}.orig"

src_install() {
	sed -i -r "s:\`dirname \\\$PRG\`:/usr/lib/${PN}:" start_proximity.sh
	sed -i "s#python #${PYTHON} #" start_proximity.sh
	newbin start_proximity.sh blueproximity
	insinto "/usr/lib/${PN}"
	doins blueproximity*
	doins proximity*
	dodoc COPYING
	dodoc README
	dodoc ChangeLog
	doman doc/blueproximity.1
	dohtml doc/*
	insinto /usr/share/applications
	doins addons/blueproximity.desktop
	insinto /usr/share/pixmaps
	doins addons/blueproximity.xpm
	strip-linguas ${MY_AVAILABLE_LINGUAS}
	for l in ${LINGUAS};
	do
		dodir "/usr/lib/${PN}/LANG/${l}"
		cp -r "${S}/LANG/${l}" "${D}/usr/lib/${PN}/LANG"
	done
}
