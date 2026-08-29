
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
git clone --depth 1 https://github.com/sirpdboy/luci-theme-kucat.git && rm -rf luci-theme-kucat/.git
git clone --depth 1 https://github.com/pymumu/luci-app-smartdns && rm -rf luci-app-smartdns/.git
git clone --depth 1 https://github.com/pymumu/openwrt-smartdns smartdns && rm -rf smartdns/.git
git clone --depth 1 https://github.com/cyzzc/openwrt_nezha && mvdir openwrt_nezha
git clone --depth 1 https://github.com/sirpdboy/luci-app-advancedplus && rm -rf luci-app-advancedplus/.git
git clone --depth 1 https://github.com/sirpdboy/luci-app-eqosplus && rm -rf luci-app-eqosplus/.git
git clone --depth 1 https://github.com/vernesong/OpenClash && mvdir OpenClash
git clone --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall passwall && mv -n passwall/luci-app-passwall ./;rm -rf passwall
git clone --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall-packages && mvdir openwrt-passwall-packages
git clone --depth 1 https://github.com/esirplayground/luci-app-poweroff && rm -rf luci-app-poweroff/.git
git clone --depth 1 https://github.com/destan19/OpenAppFilter && mvdir OpenAppFilter
git clone --depth 1 https://github.com/QiuSimons/openwrt-mos && mv -n openwrt-mos/{dat,luci-app-mosdns,mosdns,v2ray-geodata} ./; rm -rf openwrt-mos
git clone --depth 1 https://github.com/fw876/helloworld && mv -n helloworld/{dns2socks-rust,dns2tcp,dnsproxy,gn,ipt2socks-rs,lua-neturl,luci-app-ssr-plus,mihomo,redsocks2,shadowsocks-libev,tuic-client,v2ray-core,v2raya} ./ ; rm -rf helloworld
#git clone --depth 1 https://github.com/kiddin9/kwrt-packages && mv -n kwrt-packages/luci-app-bypass kwrt-packages/luci-app-fileassistant ./ ; rm -rf kwrt-packages
git clone --depth 1 https://github.com/sirpdboy/luci-theme-opentopd && rm -rf luci-theme-opentopd/.git


git_sparse_clone master "https://github.com/immortalwrt/packages" "immpack" net/haproxy

find . -type f -name "update.sh" -exec rm -f {} \;
exit 0
