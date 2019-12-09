# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_PN="github.com/42wim/${PN}"

inherit golang-build golang-vcs-snapshot user

DESCRIPTION="Connect to your Mattermost or Slack using your IRC-client of choice"
HOMEPAGE="https://github.com/42wim/matterircd"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug pie static"

DOCS=( README.md )
QA_PRESTRIPPED="usr/bin/.*"

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

pkg_setup() {
	enewgroup matterircd
	enewuser matterircd -1 -1 -1 matterircd
}

src_compile() {
	export GOPATH="${G}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	(use static && ! use pie) && export CGO_ENABLED=0
	(use static && use pie) && CGO_LDFLAGS+=" -static"

	local mygoargs=(
		-v -work -x
		-buildmode "$(usex pie pie exe)"
		-asmflags "all=-trimpath=${S}"
		-gcflags "all=-trimpath=${S}"
		-ldflags "$(usex !debug '-s -w' '')"
		-tags "$(usex static 'netgo' '')"
		-installsuffix "$(usex static 'netgo' '')"
	)

	go build "${mygoargs[@]}" || die
}

src_install() {
	dobin matterircd
	use debug && dostrip -x /usr/bin/matterircd
	einstalldocs

	newinitd "${FILESDIR}/${PN}.initd" "${PN}"
	newconfd "${FILESDIR}/${PN}.confd" "${PN}"

	insinto /etc/matterircd
	doins matterircd.toml.example

	diropts -o matterircd -g matterircd -m 0750
	keepdir /var/log/matterircd
}
