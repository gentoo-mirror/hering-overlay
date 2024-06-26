# Copyright 2019-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3 python3_{8..13} )

inherit distutils-r1 pypi

DESCRIPTION="A library wrapping email authentication header verification and generation"
HOMEPAGE="
	https://pypi.org/project/authheaders/
	https://github.com/ValiMail/authentication-headers/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="
	>=dev-python/authres-1.0.1[${PYTHON_USEDEP}]
	dev-python/dkimpy[${PYTHON_USEDEP}]
	dev-python/dnspython[${PYTHON_USEDEP}]
	>=dev-python/publicsuffix-2.20190205[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
