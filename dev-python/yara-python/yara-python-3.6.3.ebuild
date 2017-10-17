# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Python interface for YARA"
HOMEPAGE="
	https://github.com/VirusTotal/yara-python
	https://pypi.python.org/pypi/yara-python"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuckoo magic dotnet profiling"

RDEPEND="cuckoo? ( app-antivirus/cuckoo )"
DEPEND="${RDEPEND}"

python_configure_all() {
	mydistutilsargs=(
		$(use_enable cuckoo)
		$(use_enable magic)
		$(use_enable dotnet)
		$(use_enable profiling)
	)
}
