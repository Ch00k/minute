# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit subversion webapp depend.php depend.apache

DESCRIPTION="A browser-based multilingual IMAP client with an application-like user interface"
HOMEPAGE="http://roundcube.net"
ESVN_REPO_URI="https://svn.roundcube.net/trunk/roundcubemail/"

# roundcube is GPL-licensed, the rest of the licenses here are
# for bundled PEAR components, googiespell and utf8.class.php
LICENSE="GPL-2 BSD PHP-2.02 PHP-3 MIT public-domain"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~sparc ~x86"
IUSE="ldap mysql postgres ssl spell"

DEPEND=""
RDEPEND="dev-lang/php[crypt,iconv,json,ldap?,pcre,postgres?,session,spl,ssl?,unicode]
	!postgres? ( !mysql? ( dev-lang/php[sqlite] ) )
	spell? ( dev-lang/php[curl,spell] )
	dev-php/PEAR-PEAR
"

need_httpd_cgi
need_php_httpd

S=${WORKDIR}/${MY_P}

pkg_setup() {
	use mysql && require_php_with_any_use mysql mysqli

	# add some warnings about optional functionality
	if ! PHPCHECKNODIE="yes" require_php_with_any_use gd gd-external; then
		ewarn "IMAP quota display will not work correctly without GD support in PHP."
		ewarn "Recompile PHP with either gd or gd-external in USE if you want this feature."
		ewarn
	fi

	webapp_pkg_setup
}

src_prepare() {
	mv config/db.inc.php{.dist,}
	mv config/main.inc.php{.dist,}
}

src_install () {
	webapp_src_preinst
	dodoc CHANGELOG INSTALL README UPGRADING

	insinto "${MY_HTDOCSDIR}"
	doins -r [[:lower:]]* SQL

	webapp_serverowned "${MY_HTDOCSDIR}"/logs
	webapp_serverowned "${MY_HTDOCSDIR}"/temp

	webapp_configfile "${MY_HTDOCSDIR}"/config/{db,main}.inc.php
	webapp_postinst_txt en "${FILESDIR}"/postinstall-en.txt
	webapp_postupgrade_txt en UPGRADING
	webapp_src_install
}