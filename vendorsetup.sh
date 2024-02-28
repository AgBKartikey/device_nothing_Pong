echo 'Cloning Vendor'
# vendor/nothing/Pong
git clone --depth=1 https://gitlab.com/chandu078/android_vendor_nothing_Pong.git vendor/nothing/Pong

echo 'DONE'

echo 'Cloning Kernel'
# kernel/nothing/sm8475
git clone --depth=1 https://github.com/Nothing-phone-2-Development/android_kernel_nothing_sm8475.git kernel/nothing/sm8475

echo 'DONE'

echo 'Cloning PAGlyph Repo'
# packages/apps/ParanoidGlyphPhone2
git clone https://github.com/AgBKartikey/packages_apps_ParanoidGlyphPhone2.git packages/apps/ParanoidGlyphPhone2

echo 'DONE'

echo 'Picking build/soong Commits'
# build/soong
cd build/soong
git fetch https://github.com/Nothing-phone-2-Development/android_build_soong
git cherry-pick 053379d77f1b69cddb7c7ab851004f4b47b29d76
git cherry-pick --abort
git cherry-pick 53484d9d74d69becc9c47ebb9c7461e1206d5e63
git cherry-pick --abort
git cherry-pick fbb359ef5f7e30f8b4cd8e9aec8a123b2da45c9a
git cherry-pick --abort
git cherry-pick b379237b5505aff1968d3f16dfb43fbc725e548e
git cherry-pick --abort
git cherry-pick b23d5b52d21bc30356367365bdf6b78bf103bf20
git cherry-pick --abort
git cherry-pick 5f19e8a6cc2c39e98768675711f4a673639bd539
git cherry-pick --abort
cd ../../

echo 'DONE'

echo 'Picking art Commits'
# art
cd art
git fetch https://github.com/Nothing-phone-2-Development/android_art
git cherry-pick 53923736a42d8ca2a931f47e2771424eb862a027
git cherry-pick --abort
git cherry-pick 116c078da19b7bb2b13377c0fa267ac39f7ef546
git cherry-pick --abort
git cherry-pick 2e372bc44b8e65620409b7016d20a4da69e0386e
git cherry-pick --abort
git cherry-pick dd4d46d85eaffb0d1a10b23a55b104a10cf697f1
git cherry-pick --abort
cd ../

echo 'DONE'

echo 'Picking Display Hal Commit'
# hardware/qcom-caf/sm8450/display
cd hardware/qcom-caf/sm8450/display
git fetch https://github.com/Nothing-phone-2-Development/android_hardware_qcom_display
git cherry-pick 6ad257ed6fdedaf63ec6378559eb88c6013de80d
git cherry-pick --abort
cd ../../../../

echo 'DONE'

echo 'Picking Sepolicy Commits'
# device/qcom/sepolicy_vndr/sm8450
cd device/qcom/sepolicy_vndr/sm8450
git fetch https://github.com/Nothing-phone-2-Development/android_device_qcom_sepolicy_vndr
git cherry-pick 7cd972ffc847631f0a892e4d13eb1def59982268
git cherry-pick --abort
git cherry-pick 066c4d78b75d9af23bf3ff7a67c73a64c9acc810
git cherry-pick --abort
git cherry-pick fb4279c23fdd110ae0e13bdb72f36515242b866d
git cherry-pick --abort
cd ../../../../

echo 'DONE'

echo 'Picking Recovery Commit'
# bootable/recovery
cd bootable/recovery
git fetch https://github.com/Nothing-phone-2-Development/android_bootable_recovery
git cherry-pick 9d8ed44dbf266f89307088dec3a42bbbbaeb267c
git cherry-pick --abort
cd ../../

echo 'DONE'
