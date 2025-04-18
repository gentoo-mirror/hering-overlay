# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PHP_EXT_NAME="memcache"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
PHP_EXT_NEEDED_USE="session(-)?"
DOCS=( README example.php )
HTML_DOCS=( memcache.php )

USE_PHP="php7-4"

inherit php-ext-pecl-r3

DESCRIPTION="PHP extension for using memcached"
LICENSE="PHP-3"
SLOT="7"
KEYWORDS="~amd64 ~hppa ~ppc64 ~x86"
IUSE="+session"

DEPEND="php_targets_php7-4? ( sys-libs/zlib )"
RDEPEND="${DEPEND}"

# The test suite requires memcached to be running.
RESTRICT='test'

src_prepare() {
	if use php_targets_php7-4 ; then
		php-ext-source-r3_src_prepare
	else
		default
	fi
}

src_configure() {
	if use php_targets_php7-4 ; then
		local PHP_EXT_ECONF_ARGS=( --enable-memcache --with-zlib-dir="${EPREFIX}/usr" $(use_enable session memcache-session) )
		php-ext-source-r3_src_configure
	fi
}

src_install() {
	if use php_targets_php7-4 ; then
		php-ext-pecl-r3_src_install

		php-ext-source-r3_addtoinifiles "memcache.allow_failover" "true"
		php-ext-source-r3_addtoinifiles "memcache.max_failover_attempts" "20"
		php-ext-source-r3_addtoinifiles "memcache.chunk_size" "32768"
		php-ext-source-r3_addtoinifiles "memcache.default_port" "11211"
		php-ext-source-r3_addtoinifiles "memcache.hash_strategy" "consistent"
		php-ext-source-r3_addtoinifiles "memcache.hash_function" "crc32"
		php-ext-source-r3_addtoinifiles "memcache.redundancy" "1"
		php-ext-source-r3_addtoinifiles "memcache.session_redundancy" "2"
		php-ext-source-r3_addtoinifiles "memcache.protocol" "ascii"
	fi
}
