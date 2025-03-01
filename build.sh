sudo apt-get update
sudo apt-get install -y wget tar libncurses-dev bison flex libssl-dev libelf-dev bc zstd unzip rsync

wget -q -i kernel-url -O kernel.tar.xz
mkdir -p kext
tar -xf kernel.tar.xz -C kext --strip-components=1
rsync -av .config kext/
rsync -av fw kext/
cd kext
make  olddefconfig
make -j$(nproc)

