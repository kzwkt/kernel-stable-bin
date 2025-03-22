ver=6.13.7
echo $ver > ver
kernel-url="https://cdn.kernel.org/pub/linux/kernel/v${ver%%.*}.x/linux-$ver.tar.xz"
hardened-patch="https://github.com/anthraxx/linux-hardened/releases/download/v$ver-hardened1/linux-hardened-v$ver-hardened1.patch"


pt-get update
sudo apt-get install -y wget tar libncurses-dev bison flex libssl-dev libelf-dev bc zstd unzip  binutils

wget  $kernel-url -O kernel.tar.xz
mkdir -p kext
tar -xf kernel.tar.xz -C kext --strip-components=1
cp  .config kext/
cp -r fw kext/
cd kext
wget $hardened-patch
patch -Np1 < linux-hardened-v$ver-hardened1.patch
make  olddefconfig 
make -j$(nproc) 

