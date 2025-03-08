sudo apt-get update
sudo apt-get install -y wget tar libncurses-dev bison flex libssl-dev libelf-dev bc zstd unzip  binutils

wget -q -i kernel-url -O kernel.tar.xz
mkdir -p kext
tar -xf kernel.tar.xz -C kext --strip-components=1
cp  .config kext/
cp -r fw kext/
cd kext
make  olddefconfig 
make -j$(nproc) 

