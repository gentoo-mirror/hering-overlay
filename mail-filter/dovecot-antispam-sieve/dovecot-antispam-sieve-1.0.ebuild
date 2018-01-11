# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Integrates spam learning into Dovecot by Sieve"
HOMEPAGE="https://wiki.dovecot.org/HowTo/AntispamWithSieve"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="spamassassin dspam rspamd"

REQUIRED_USE="^^ ( spamassassin dspam rspamd )"

RDEPEND=">=net-mail/dovecot-2.3[sieve]
    !mail-filter/dovecot-antispam"
DEPEND="${RDEPEND}
	spamassassin? ( mail-filter/spamassassin )
    dspam? ( mail-filter/dspam )
	rspamd? ( mail-filter/rspamd )"

# Need to set S due to PMS saying we need it existing, but no SRC_URI
S=${WORKDIR}

src_install() {
    insinto /etc/dovecot/conf.d
	doins "${FILESDIR}/90-antispam-sieve.conf"

	insinto /usr/lib/dovecot/sieve
	doins "${FILESDIR}/report-spam.sieve"
	doins "${FILESDIR}/report-ham.sieve"

	exeinto /usr/lib/dovecot/sieve

	if use spamassassin ; then
        newexe "${FILESDIR}/sa-learn-spam.sh" learn-spam.sh
        newexe "${FILESDIR}/sa-learn-ham.sh" learn-ham.sh
	fi

	if use dspam ; then
        newexe "${FILESDIR}/ds-learn-spam.sh" learn-spam.sh
        newexe "${FILESDIR}/ds-learn-ham.sh" learn-ham.sh
	fi

    if use rspamd ; then
        newexe "${FILESDIR}/rs-learn-spam.sh" learn-spam.sh
        newexe "${FILESDIR}/rs-learn-ham.sh" learn-ham.sh
	fi
}

pkg_postinst()
{
	sievec /usr/lib/dovecot/sieve/report-spam.sieve
    sievec /usr/lib/dovecot/sieve/report-ham.sieve
}