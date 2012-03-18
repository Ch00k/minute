# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

MY_P="jabberbot-${PV}"
DESCRIPTION="A simple framework for creating Jabber/XMPP bots and services in Python"
HOMEPAGE="http://thp.io/2007/python-jabberbot"
SRC_URI="mirror://sourceforge/pythonjabberbot/jabberbot-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${MY_P}"

RDEPEND="dev-python/xmpppy"

DEPEND=""
