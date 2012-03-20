# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="4"
PYTHON_DEPEND="2:2.6 3:3.1"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Python MPD client library (fork)"
HOMEPAGE="https://github.com/Mic92/python-mpd2"
SRC_URI="https://github.com/Mic92/python-mpd2/tarball/v0.4.1 -> ${P}.tar.gz"
S="${WORKDIR}/Mic92-python-mpd2-08e2da8"

LICENSE="LGPL-3"
# no keywords for now, since it is a fork of the official version
KEYWORDS=""
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND=""

PYTHON_MODNAME="mpd.py"
DOCS="CHANGES.txt README.md LICENSE.txt GPL.txt doc/commands.txt"
