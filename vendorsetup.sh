echo 'Starting vendorsetup processes needed for your device'

# Stuffs to rm -rf
rm -rf vendor/nothing/Pong
rm -rf kernel/nothing/sm8475
rm -rf hardware/qcom-caf/sm8450/display
rm -rf device/qcom/sepolicy_vndr/sm8450
rm -rf packages/apps/ParanoidGlyph
rm -rf vendor/nothing/camera

echo 'Cloning Vendor tree [1/7]'
# vendor/nothing/Pong
git clone https://gitlab.com/RealYasin/vendor_nothing_pong.git vendor/nothing/Pong

echo 'DONE'

echo 'Cloning Kernel tree [2/7]'
# kernel/nothing/sm8475
git clone --depth=1 https://github.com/HELLBOY017/kernel_nothing_sm8475.git -b inline kernel/nothing/sm8475

echo 'DONE'

echo 'Cloning Display Hal [3/7]'
# hardware/qcom-caf/sm8450/display
git clone --depth=1 https://github.com/Nothing-phone-2-Development/android_hardware_qcom_display.git hardware/qcom-caf/sm8450/display

echo 'DONE'

echo 'Cloning sepolicy_vndr [4/7]'
# device/qcom/sepolicy_vndr/sm8450
git clone https://github.com/PongxViolet/device_qcom_sepolicy_vndr.git device/qcom/sepolicy_vndr/sm8450

echo 'DONE'

echo 'Cloning Dolby [5/7]'
# hardware/dolby
git clone https://github.com/FlamingoOS-Devices/hardware_dolby.git hardware/dolby

echo 'DONE'

echo 'Cloning PAGlyph Repo [6/7]'
# packages/apps/ParanoidGlyph
git clone https://github.com/ProjectGhostOS/android_packages_apps_ParanoidGlyph.git packages/apps/ParanoidGlyph

echo 'DONE'

echo 'Cloning NOSCamera [7/7]'
# vendor/nothing/camera
git clone https://gitlab.com/GhosutoX/vendor_nothing_camera.git vendor/nothing/camera

echo 'Done and Completed'
