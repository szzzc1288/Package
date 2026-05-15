
#!/bin/bash
function git_clone() {
  git clone --depth 1 $1 $2 || true
 }
function git_sparse_clone() {
  branch="$1" rurl="$2" localdir="$3" && shift 3
  git clone -b $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
  cd $localdir
  git sparse-checkout init --cone
  git sparse-checkout set $@
  mv -n $@ ../
  cd ..
  rm -rf $localdir
  }
function mvdir() {
mv -n `find $1/* -maxdepth 0 -type d` ./
rm -rf $1
}
git clone --depth 1 https://github.com/sirpdboy/luci-app-eqosplus && rm -rf luci-app-eqosplus/.git
# git clone --depth 1 https://github.com/sirpdboy/netspeedtest && mvdir netspeedtest
git clone --depth 1 https://github.com/vernesong/OpenClash && mvdir OpenClash
git clone --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall-packages && mvdir openwrt-passwall-packages
# git clone --depth 1 -b luci-smartdns-dev https://github.com/xiaorouji/openwrt-passwall passwall && mv -n passwall/luci-app-passwall ./;rm -rf passwall
git clone --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall passwall && mv -n passwall/luci-app-passwall ./;rm -rf passwall
git clone --depth 1 https://github.com/sirpdboy/luci-theme-kucat.git && rm -rf luci-theme-kucat/.git
git clone --depth 1 https://github.com/esirplayground/luci-app-poweroff && rm -rf luci-app-poweroff/.git
git clone --depth 1 https://github.com/destan19/OpenAppFilter && mvdir OpenAppFilter
# git clone --depth 1 https://github.com/sirpdboy/luci-app-advanced
git clone --depth 1 -b lede https://github.com/pymumu/luci-app-smartdns && rm -rf luci-app-smartdns/.git
git clone --depth 1 https://github.com/pymumu/openwrt-smartdns smartdns && rm -rf smartdns/.git
# git clone --depth 1 https://github.com/cyzzc/luci-app-vssr
# git clone --depth 1 https://github.com/jerrykuku/lua-maxminddb
# git clone --depth 1 https://github.com/QiuSimons/openwrt-mos && mv -n openwrt-mos/*mosdns ./ && mv -n openwrt-mos/dat ./ ; rm -rf openwrt-mos
git clone --depth 1 https://github.com/QiuSimons/openwrt-mos && mvdir openwrt-mos
git clone --depth 1 https://github.com/cyzzc/openwrt_nezha && mvdir openwrt_nezha
git clone --depth 1 https://github.com/fw876/helloworld && mv -n helloworld/{luci-app-ssr-plus,tuic-client,shadow-tls,redsocks2,lua-neturl,dns2tcp,v2ray-core,trojan,dns2socks-rust,gn} ./ ; rm -rf helloworld
# git clone --depth 1 https://github.com/sirpdboy/luci-theme-kucat
git clone --depth 1 https://github.com/sirpdboy/luci-app-advancedplus && rm -rf luci-app-advancedplus/.git
git clone --depth 1 https://github.com/kiddin9/kwrt-packages && mv -n kwrt-packages/luci-app-bypass kwrt-packages/luci-app-fileassistant ./ ; rm -rf kwrt-packages
git clone --depth 1 https://github.com/sirpdboy/luci-theme-opentopd && rm -rf smartdns/.git
#svn export https://github.com/immortalwrt/packages/trunk/net/smartdns

git_sparse_clone master "https://github.com/coolsnowwolf/packages" "leanpack" net/miniupnpd net/mwan3 \
multimedia/gmediarender multimedia/UnblockNeteaseMusic-Go net/phtunnel net/frp net/headscale net/go-aliyundrive-webdav \
net/verysync net/vlmcsd net/dnsforwarder net/tcpping net/netatalk net/pgyvpn net/msd_lite \
net/nps net/tcpping net/amule net/baidupcs-web 
mv -f miniupnpd miniupnpd-iptables

git_sparse_clone master "https://github.com/coolsnowwolf/luci" "leanluci" applications/luci-app-unblockmusic \
libs/luci-lib-fs

git_sparse_clone openwrt-24.10 "https://github.com/openwrt/packages" "24packages" \
utils/cgroupfs-mount utils/coremark utils/watchcat utils/dockerd net/nginx net/uwsgi net/ddns-scripts \
net/ariang admin/netdata net/transmission-web-control net/rp-pppoe net/tailscale
git_sparse_clone openwrt-24.10 "https://github.com/openwrt/openwrt" "openwrt" \
package/base-files package/network/config/firewall4 package/network/config/firewall package/system/opkg package/network/services/ppp \
package/network/services/dnsmasq package/libs/openssl

git_sparse_clone master "https://github.com/immortalwrt/packages" "immpack" net/sub-web net/dnsproxy net/haproxy net/cdnspeedtest \
net/uugamebooster net/subconverter net/ngrokc net/oscam net/njitclient net/scutclient net/gowebdav net/udp2raw \
admin/btop libs/wxbase libs/rapidjson libs/libcron libs/quickjspp libs/toml11 libs/libtorrent-rasterbar \
libs/libdouble-conversion libs/qt6base libs/cxxopts libs/jpcre2 libs/alac \
utils/cpulimit devel/gn

git_sparse_clone develop "https://github.com/Ysurac/openmptcprouter-feeds" "enmptcp" luci-app-snmpd \
luci-app-packet-capture luci-app-mail msmtp
git_sparse_clone master "https://github.com/xiaoqingfengATGH/feeds-xiaoqingfeng" "xiaoqingfeng" homeredirect luci-app-homeredirect

git_sparse_clone master "https://github.com/x-wrt/com.x-wrt" "x-wrt" natflow lua-ipops luci-app-macvlan luci-app-3ginfo-lite luci-app-fakemesh
git_sparse_clone master "https://github.com/immortalwrt/immortalwrt" "immortal" package/network/utils/nftables \
package/network/utils/fullconenat package/network/utils/fullconenat-nft \
package/utils/mhz package/libs/libnftnl package/firmware/wireless-regdb

git_sparse_clone master "https://github.com/sbwml/openwrt_pkgs" "openwrt_pkgs" luci-app-gowebdav luci-app-ota luci-app-socat \
git_sparse_clone openwrt-24.10 "https://github.com/openwrt/luci" "opluci" applications/luci-app-watchcat \

#mv -n openwrt-passwall/* ./ ; rm -Rf openwrt-passwall
rm -rf openssl
mv -n openwrt-package/* ./ ; rm -Rf openwrt-package
mv -n openwrt-app-actions/applications/* ./;rm -rf openwrt-app-actions
sed -i \
-e 's?include \.\./\.\./\(lang\|devel\)?include $(TOPDIR)/feeds/packages/\1?' \
-e 's?2. Clash For OpenWRT?3. Applications?' \
-e 's?\.\./\.\./luci.mk?$(TOPDIR)/feeds/luci/luci.mk?' \
-e 's/ca-certificates/ca-bundle/' \
-e 's/php7/php8/g' \
-e 's/+docker /+docker +dockerd /g' \
*/Makefile

sed -i 's/PKG_VERSION:=20240302/PKG_VERSION:=20240223/g; s/PKG_RELEASE:=$(AUTORELESE)/PKG_RELEASE:=1/g' webd/Makefile
sed -i 's/luci-lib-ipkg/luci-base/g' luci-app-store/Makefile
sed -i "/minisign:minisign/d" luci-app-dnscrypt-proxy2/Makefile
sed -i 's/+dockerd/+dockerd +cgroupfs-mount/' luci-app-docker*/Makefile
sed -i '$i /etc/init.d/dockerd restart &' luci-app-docker*/root/etc/uci-defaults/*
sed -i 's/+libcap /+libcap +libcap-bin /' luci-app-openclash/Makefile
sed -i 's/\(+luci-compat\)/\1 +luci-theme-argon/' luci-app-argon-config/Makefile
sed -i 's/\(+luci-compat\)/\1 +luci-theme-design/' luci-app-design-config/Makefile
sed -i 's/\(+luci-compat\)/\1 +luci-theme-argone/' luci-app-argone-config/Makefile
sed -i 's/+vsftpd-alt$/+vsftpd/' luci-app-tencentcloud-cos/Makefile
sed -i 's/ +uhttpd-mod-ubus//' luci-app-packet-capture/Makefile
sed -i 's/	ip.neighbors/	luci.ip.neighbors/' luci-app-wifidog/luasrc/model/cbi/wifidog/wifidog_cfg.lua
#sed -i -e 's/nas/services/g' -e 's/NAS/Services/g' $(grep -rl 'nas\|NAS' luci-app-fileassistant)
#sed -i -e 's/nas/services/g' -e 's/NAS/Services/g' $(grep -rl 'nas\|NAS' luci-app-alist)
sed -i 's/USE_QUIC=1/USE_QUIC=/g' haproxy/Makefile
#find . -type f -name Makefile -exec sed -i 's/PKG_BUILD_FLAGS:=no-mips16/PKG_USE_MIPS16:=0/g' {} +
sed -i '/entry({"admin", "nas"}, firstchild(), "NAS", 45).dependent = false/d; s/entry({"admin", "network", "eqos"}, cbi("eqos"), _("EQoS"))/entry({"admin", "network", "eqos"}, cbi("eqos"), _("EQoS"), 121).dependent = true/' luci-app-eqos/luasrc/controller/eqos.lua
#sed -i '65,73d' adguardhome/Makefile
sed -i 's/PKG_SOURCE_DATE:=2/PKG_SOURCE_DATE:=3/' transmission-web-control/Makefile
find . -type f -name "update.sh" -exec rm -f {} \;
rm -rf adguardhome/patches
exit 0
