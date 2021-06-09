# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_8 )
inherit distutils-r1

DESCRIPTION="This is a Django project that contains default settings and url settings for Mailman 3 Web Interface"
HOMEPAGE="https://pypi.org/project/mailman-web/"
SRC_URI="mirror://pypi/${PN:0:1}"/${PN}/${P}.tar.gz

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="net-mail/hyperkitty[${PYTHON_USEDEP}]
	net-mail/postorius[${PYTHON_USEDEP}]"
BDEPEND=""
