echo 'Cloning Vendor Repo'
git clone --depth=1 https://gitlab.com/AgBKartikey/vendor_nothing_Pong.git vendor/nothing/Pong

echo 'DONE'

echo 'Cloning Kernel Repo'
# kernel/nothing/sm8475
git clone --depth=1 https://github.com/AgBKartikey/android_kernel_nothing_sm8475.git kernel/nothing/sm8475

echo 'DONE'

echo 'Patching KernelSU'
cd kernel/nothing/sm8475
curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash -
cd ../../../

echo 'DONE'

echo 'Cloning Glyph Repo'
# packages/apps/ParanoidGlyphPhone2
git clone https://github.com/AgBKartikey/packages_apps_ParanoidGlyphPhone2.git packages/apps/ParanoidGlyphPhone2

echo 'DONE & COMPLETED'
