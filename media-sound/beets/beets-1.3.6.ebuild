# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="sqlite"

inherit bash-completion-r1 distutils-r1 eutils

MY_PV=${PV/_beta/-beta.}
MY_P=${PN}-${MY_PV}

DESCRIPTION="A media library management system for obsessive-compulsive music geeks"
SRC_URI="https://github.com/sampsyo/beets/releases/download/v${PV}/${P}.tar.gz"
HOMEPAGE="http://beets.radbox.org/ http://pypi.python.org/pypi/beets"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="MIT"
IUSE="bpd chroma convert discogs doc echonest info lastgenre mpdstats replaygain test web"

# beatport and bench are not listed in the beets plugin docs, I guess they are mandatory.
# echonest_tempo is a deprecated version of echonest.
RDEPEND="
    dev-python/munkres[${PYTHON_USEDEP}]
    >=dev-python/python-musicbrainz-ngs-0.4[${PYTHON_USEDEP}]
    dev-python/unidecode[${PYTHON_USEDEP}]
    >=media-libs/mutagen-1.22[${PYTHON_USEDEP}]
    dev-python/pyyaml[${PYTHON_USEDEP}]
    dev-python/enum34[${PYTHON_USEDEP}]
    dev-python/requests[${PYTHON_USEDEP}]
    bpd? ( dev-python/bluelet[${PYTHON_USEDEP}] )
    chroma? ( dev-python/pyacoustid[${PYTHON_USEDEP}] )
    convert? ( media-video/ffmpeg:0[encode] )
    discogs? ( dev-python/discogs-client[${PYTHON_USEDEP}] )
    doc? ( dev-python/sphinx )
    echonest? ( dev-python/pyechonest[${PYTHON_USEDEP}] )
	info? ( || ( media-sound/id3v2 media-sound/mp3info ) )
    lastgenre? ( dev-python/pylast[${PYTHON_USEDEP}] )
    mpdstats? ( dev-python/python-mpd[${PYTHON_USEDEP}] )
    replaygain? (
        dev-python/gst-python:1.0
        media-plugins/gst-plugins-mad:1.0
        media-libs/gst-plugins-good:1.0
    )
    web? ( dev-python/flask[${PYTHON_USEDEP}] )
"

DEPEND="${RDEPEND}
    dev-python/setuptools[${PYTHON_USEDEP}]"

S=${WORKDIR}/${MY_P}

src_prepare() {
    # remove plugins that do not have appropriate dependencies installed
    for flag in bpd chroma convert discogs echonest info lastgenre mpdstats \
                replaygain web;do
        if ! use $flag ; then
            rm -r beetsplug/${flag}.py || \
            rm -r beetsplug/${flag}/ ||
                die "Unable to remove $flag plugin"
        fi
    done

    if ! use echonest ; then
        rm -r beetsplug/echonest_tempo.py || \
            die "Unable to fully remove echonest plugin"
    fi

    for flag in bpd lastgenre web;do
        if ! use $flag ; then
            sed -i "s:'beetsplug.$flag',::" setup.py || \
                die "Unable to disable $flag plugin "
        fi
    done

    use bpd || rm -f test/test_player.py

}

python_compile_all() {
    use doc && emake -C docs html
}

python_test() {
    cd test
    if ! use web;then
        rm test_web.py || die "Failed to remove test_web.py"
    fi
    "${PYTHON}" testall.py || die "Testsuite failed"
}

python_install_all() {
	doman man/beet.1 man/beetsconfig.5

    use doc && dohtml -r docs/_build/html/

	distutils-r1_python_install_all

	newbashcomp "${PN}/ui/completion_base.sh" ${PN}
}

pkg_postinst() {
    elog "The following plugins has been installed without extra dependencies:"
    elog "FromFilename, Lyrics, MBSync, FetchArt, EmbedArt, Scrub, Zero, FtInTitle, Key Finder, Inline, Rewrite, The, Bucket, MPDUpdate, ImportFeeds, Smart Playlist, Play, Random, Fuzzy Search, MusicBrainz Collection, IHate, Missing, Duplicates"
    elog "The remaining plugins require dependiencies and are USE flag driven."
    elog "Learn more about beets plugins at http://beets.readthedocs.org/en/v${PV}/plugins/"
}
