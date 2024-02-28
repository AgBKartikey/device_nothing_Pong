echo 'Starting vendorsetup processes needed for your device'

# Stuffs to rm -rf
rm -rf hardware/qcom-caf/sm8450/display
rm -rf device/qcom/sepolicy_vndr/sm8450
rm -rf vendor/qcom/opensource/vibrator

echo 'Cloning Vendor tree [1/7]'
# vendor/nothing/Pong
git clone https://gitlab.com/RealYasin/vendor_nothing_pong.git vendor/nothing/Pong

echo 'DONE'

echo 'Cloning Kernel tree [2/7]'
# kernel/nothing/sm8475
git clone --depth=1 https://github.com/Nothing-phone-2-Development/android_kernel_nothing_sm8475.git kernel/nothing/sm8475

echo 'DONE'

echo 'Cloning Display Hal [3/7]'
# hardware/qcom-caf/sm8450/display
git clone --depth=1 https://github.com/Nothing-phone-2-Development/android_hardware_qcom_display.git hardware/qcom-caf/sm8450/display

echo 'DONE'

echo 'Cloning sepolicy_vndr [4/7]'
# device/qcom/sepolicy_vndr/sm8450
git clone https://github.com/PongxViolet/device_qcom_sepolicy_vndr.git device/qcom/sepolicy_vndr/sm8450

echo 'DONE'

echo 'Cloning oss Vibrator [5/7]'
# vendor/qcom/opensource/vibrator
git clone --depth=1 https://github.com/PongxViolet/vendor_qcom_opensource_vibrator.git  -b thirteen vendor/qcom/opensource/vibrator

echo 'DONE'

echo 'Cloning Dolby [6/7]'
# hardware/dolby
git clone https://github.com/FlamingoOS-Devices/hardware_dolby.git hardware/dolby

echo 'DONE'

echo 'Cloning PAGlyph Repo [7/7]'
# packages/apps/ParanoidGlyph
git clone https://github.com/PongxViolet/android_packages_apps_ParanoidGlyph.git packages/apps/ParanoidGlyph

echo 'Done and Completed'
