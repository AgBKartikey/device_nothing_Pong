echo 'Starting vendorsetup processes needed for your device'

# Stuffs to rm -rf
rm -rf hardware/qcom-caf/sm8450/display
rm -rf device/qcom/sepolicy_vndr/sm8450
rm -rf vendor/qcom/opensource/vibrator

echo 'Cloning Vendor tree [1/6]'
# vendor/nothing/Pong
git clone https://gitlab.com/RealYasin/vendor_nothing_pong.git vendor/nothing/Pong

echo 'DONE'

echo 'Cloning Kernel tree [2/6]'
# kernel/nothing/sm8475
git clone --depth=1 https://github.com/Nothing-phone-2-Development/android_kernel_nothing_sm8475.git kernel/nothing/sm8475

echo 'DONE'

echo 'Cloning Display Hal [3/6]'
# hardware/qcom-caf/sm8450/display
git clone --depth=1 https://github.com/Nothing-phone-2-Development/android_hardware_qcom_display.git hardware/qcom-caf/sm8450/display

echo 'DONE'

echo 'Cloning sepolicy_vndr [4/6]'
# device/qcom/sepolicy_vndr/sm8450
git clone https://github.com/PongxViolet/device_qcom_sepolicy_vndr.git device/qcom/sepolicy_vndr/sm8450

echo 'DONE'

echo 'Cloning oss Vibrator [5/6]'
# vendor/qcom/opensource/vibrator
git clone --depth=1 https://github.com/PongxViolet/vendor_qcom_opensource_vibrator.git  -b thirteen vendor/qcom/opensource/vibrator

echo 'DONE'

echo 'Cloning Dolby [6/6]'
# hardware/dolby
git clone https://github.com/FlamingoOS-Devices/hardware_dolby.git hardware/dolby

echo 'Done and Completed'
