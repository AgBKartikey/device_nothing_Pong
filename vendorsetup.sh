echo 'Cloning Vendor Repo'
git clone --depth=4 https://gitlab.com/AgBKartikey/vendor_nothing_Pong.git vendor/nothing/Pong

echo 'DONE'

echo 'Cloning Kernel Repo'
# kernel/nothing/sm8475
git clone --depth=1 https://github.com/AgBKartikey/android_kernel_nothing_sm8475.git kernel/nothing/sm8475

echo 'DONE'

echo 'Cloning Glyph Repo'
# packages/apps/ParanoidGlyphPhone2
git clone https://github.com/AgBKartikey/packages_apps_ParanoidGlyphPhone2.git packages/apps/ParanoidGlyphPhone2

echo 'DONE'

echo 'Cloning Dolby Repo'
# hardware/dolby
git clone https://github.com/AgBKartikey/hardware_dolby.git -b DM hardware/dolby

echo 'DONE & COMPLETED'
