# Copyright 1999-22019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit linux-mod

COMMIT="e9fbf5c051453941bbc029810b893a6c010714e6"

DESCRIPTION="Realtek 8812AU USB WiFi module for Linux kernel"
HOMEPAGE="https://github.com/aircrack-ng/rtl8812au"
SRC_URI="https://github.com/aircrack-ng/rtl8812au/archive/${COMMIT}.zip -> rtl8812au-${PV}.zip"

LICENSE="GPL-2"
KEYWORDS="~amd64"

DEPEND="virtual/linux-sources
	app-arch/unzip"
RDEPEND=""

S="${WORKDIR}/rtl8812au-${COMMIT}"

MODULE_NAMES="88XXau(net/wireless)"
BUILD_TARGETS="all"
BUILD_TARGET_ARCH="${ARCH}"

PATCHES=( "${FILESDIR}"/linux-5.10.patch )

src_unpack() {
	unpack "${A}"
	cd "${S}"
}

pkg_setup() {
	linux-mod_pkg_setup
	BUILD_PARAMS="KERN_DIR=${KV_DIR} KSRC=${KV_DIR} KERN_VER=${KV_FULL} O=${KV_OUT_DIR} V=1 KBUILD_VERBOSE=1"
}

src_compile(){
	linux-mod_src_compile
}

src_install() {
	linux-mod_src_install
}

pkg_postinst() {
	linux-mod_pkg_postinst
}

