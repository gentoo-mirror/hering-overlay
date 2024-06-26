# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3_{8..13} )

inherit distutils-r1 pypi

DESCRIPTION="Django-based interfaces interacting with Mailman 3"
HOMEPAGE="https://www.list.org"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/django[${PYTHON_USEDEP}]
	net-mail/mailmanclient[${PYTHON_USEDEP}]
	dev-python/django-allauth[${PYTHON_USEDEP}]
	dev-python/django-gravatar2[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
"

DOCS=( README.rst )

python_test() {
	local -x DJANGO_SETTINGS_MODULE=django_mailman3.tests.settings_test
	local -x PYTHONPATH="${S}"
	django-admin test -v 2 || die
}
