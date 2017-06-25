# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

DESCRIPTION="nemo-preview is a quick previewer for nemo"
HOMEPAGE="https://github.com/linuxmint/nemo-extensions"
SRC_URI="https://github.com/linuxmint/nemo-extensions/archive/${PV}.tar.gz"
S="${WORKDIR}/nemo-extensions-${PV}/${PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND=">=gnome-extra/nemo-${PV}[introspection]
	media-libs/gstreamer:1.0
	app-text/evince
	net-libs/webkit-gtk:3
	media-libs/musicbrainz:5
"
src_prepare() {
	if [[ ! -e configure ]] ; then
		./autogen.sh || die
	fi
}
