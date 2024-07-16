echo 'Starting vendorsetup processes needed for your device'

# Stuffs to rm -rf
rm -rf hardware/qcom-caf/sm8450/display
rm -rf device/qcom/sepolicy_vndr/sm8450
rm -rf packages/apps/ParanoidGlyph

echo 'Cloning Vendor tree [1/6]'
# vendor/nothing/Pong
git clone https://gitlab.com/AgBKartikey/vendor_nothing_Pong.git -b UDC vendor/nothing/Pong

echo 'DONE'

echo 'Cloning Kernel tree [2/6]'
# kernel/nothing/sm8475
git clone --depth=1 https://github.com/AgBKartikey/kernel_nothing_sm8475.git -b inline kernel/nothing/sm8475 && cd kernel/nothing/sm8475 && git submodule init && git submodule update --remote && cd ../../..

echo 'DONE'

echo 'Cloning Display Hal [3/6]'
# hardware/qcom-caf/sm8450/display
git clone --depth=1 https://github.com/Nothing-phone-2-Development/android_hardware_qcom_display.git hardware/qcom-caf/sm8450/display

echo 'DONE'

echo 'Cloning sepolicy_vndr [4/6]'
# device/qcom/sepolicy_vndr/sm8450
git clone https://github.com/PongxViolet/device_qcom_sepolicy_vndr.git device/qcom/sepolicy_vndr/sm8450

echo 'DONE'

echo 'Cloning PAGlyph Repo [5/6]'
# packages/apps/ParanoidGlyph
git clone https://github.com/ProjectGhostOS/android_packages_apps_ParanoidGlyph.git packages/apps/ParanoidGlyph

echo 'DONE'

echo 'Cloning Dolby [6/6]'
# hardware/dolby
git clone https://github.com/FlamingoOS-Devices/hardware_dolby.git hardware/dolby

echo 'Done and Completed'
