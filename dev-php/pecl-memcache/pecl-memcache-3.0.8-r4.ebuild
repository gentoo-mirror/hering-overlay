# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PHP_EXT_NAME="memcache"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
DOCS=( README )
PATCHES=( "${FILESDIR}/3.0.8-c99-inline.patch" )

USE_PHP="php5-6"

inherit php-ext-pecl-r3

DESCRIPTION="PHP extension for using memcached"
LICENSE="PHP-3"
SLOT="5"
KEYWORDS="~amd64 ~hppa ~ppc64 ~x86"
IUSE="+session"

DEPEND="sys-libs/zlib
	dev-lang/php:5.6[session?]"
RDEPEND="${DEPEND}"

# The test suite requires memcached to be running.
RESTRICT='test'

src_configure() {
	local PHP_EXT_ECONF_ARGS=( --enable-memcache --with-zlib-dir=/usr $(use_enable session memcache-session) )
	php-ext-source-r3_src_configure
}

src_install() {
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
}
