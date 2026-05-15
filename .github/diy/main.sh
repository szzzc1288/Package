
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
#git clone --depth 1 -b lede https://github.com/pymumu/luci-app-smartdns && rm -rf luci-app-smartdns/.git
#git clone --depth 1 https://github.com/pymumu/openwrt-smartdns smartdns && rm -rf smartdns/.git
git clone --depth 1 https://github.com/cyzzc/openwrt_nezha && mvdir openwrt_nezha
git clone --depth 1 https://github.com/sirpdboy/luci-app-advancedplus && rm -rf luci-app-advancedplus/.git

find . -type f -name "update.sh" -exec rm -f {} \;
exit 0
