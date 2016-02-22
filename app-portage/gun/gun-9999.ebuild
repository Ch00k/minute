# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 git-2

EGIT_REPO_URI="git://github.com/Ch00k/gun.git"

DESCRIPTION="Gentoo Updates Notifier"
HOMEPAGE="https://github.com/Ch00k/gun"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-python/xmpppy"

DEPEND=""
