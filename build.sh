ver=6.15.4
echo $ver > ver
kernel_url="https://cdn.kernel.org/pub/linux/kernel/v${ver%%.*}.x/linux-$ver.tar.xz"


sudo apt-get update
sudo apt-get install -y wget tar libncurses-dev bison flex libssl-dev libelf-dev bc zstd unzip  binutils --no-install-recommends

wget  $kernel_url -O kernel.tar.xz
mkdir -p kext
tar -xf kernel.tar.xz -C kext --strip-components=1
cp  .config kext/
cp -r fw kext/
cd kext

make  olddefconfig 

export KCFLAGS="-O2 -march=icelake-client  -pipe"
export KCPPFLAGS="-O2 -march=icelake-client -pipe"

make -j$(nproc) 

