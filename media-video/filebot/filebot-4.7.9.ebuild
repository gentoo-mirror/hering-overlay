# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# shellcheck disable=SC2034
EAPI=8

inherit java-utils-2

DESCRIPTION="Java-based tools to rename TV shows, download subtitles, and validate checksums"
HOMEPAGE="https://www.filebot.net/"

MY_PN="FileBot"
SRC_URI="https://downloads.sourceforge.net/project/${PN}/${PN}/${MY_PN}_${PV}/${MY_PN}_${PV}-portable.tar.xz"
S="${WORKDIR}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="|| ( virtual/jdk virtual/jre )
		media-libs/chromaprint
		media-libs/fontconfig"

src_install() {
	java-pkg_dojar "${MY_PN}.jar"
	exeopts -m755
	exeinto "/usr/bin"
	newexe "${FILESDIR}/${PN}.sh" "${PN}"
	insopts -m644
	insinto "/usr/share/pixmaps"
	doins "${FILESDIR}/${PN}.svg"
	insinto "/usr/share/applications"
	doins "${FILESDIR}/${PN}.desktop"
}
