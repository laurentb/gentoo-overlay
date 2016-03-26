# Copyright 2012-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Sync FLAC music files to Ogg Vorbis (or keep lossy as-is)"
HOMEPAGE="https://pypi.python.org/pypi/brutha"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+replaygain"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="media-libs/mutagen[${PYTHON_USEDEP}]
	media-sound/sox
	replaygain? ( media-sound/vorbisgain )
	|| ( sys-devel/make sys-process/parallel )"

DOCS=( README LICENSE )
