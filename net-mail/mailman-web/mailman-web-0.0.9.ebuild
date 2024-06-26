# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3_{8..13} )
inherit distutils-r1 pypi

DESCRIPTION="Django project that contains default and url settings for Mailman3 Web Interface"
HOMEPAGE="https://pypi.org/project/mailman-web/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="mysql"

DEPEND=""
RDEPEND="net-mail/hyperkitty[${PYTHON_USEDEP}]
	net-mail/postorius[${PYTHON_USEDEP}]
	dev-python/cmarkgfm[${PYTHON_USEDEP}]
	dev-python/django[${PYTHON_USEDEP}]
	mysql? ( dev-python/mysqlclient[${PYTHON_USEDEP}] )"
BDEPEND=""
