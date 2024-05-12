echo 'Starting vendorsetup processes needed for your device'

# Stuffs to rm -rf
rm -rf hardware/qcom-caf/sm8450/display
rm -rf device/qcom/sepolicy_vndr/sm8450
rm -rf system/core
rm -rf vendor/qcom/opensource/vibrator

echo 'Cloning Vendor tree [1/6]'
# Vendor Tree
git clone https://gitlab.com/RealYasin/vendor_nothing_pong.git vendor/nothing/Pong

echo 'DONE'

echo 'Cloning Kernel tree [2/6]'
# Kernel Tree
git clone --depth=1 https://github.com/Nothing-phone-2-Development/android_kernel_nothing_sm8475.git kernel/nothing/sm8475

echo 'DONE'

echo 'Cloning hardware/qcom-caf/sm8450/display [3/6]'
# Display Hal
git clone --depth=1 https://github.com/Nothing-phone-2-Development/android_hardware_qcom_display.git hardware/qcom-caf/sm8450/display

echo 'DONE'

echo 'Picking commit in device/qcom/sm8450/sepolicy_vndr [4/6]'
# Sepolicy_vndr
git clone https://github.com/LineageOS/android_device_qcom_sepolicy_vndr.git -b lineage-21.0-caf-sm8450 device/qcom/sepolicy_vndr/sm8450 && cd device/qcom/sepolicy_vndr/sm8450 && git fetch https://github.com/Nothing-phone-2-Development/android_device_qcom_sepolicy_vndr.git && git cherry-pick d9fa2f5f3c36dae723d9ca0899dc0ab85e149e9d && cd ../../../..

echo 'DONE'

echo 'Reverting commits in system core [5/6]'
# system/core
git clone https://github.com/Project-Elixir/android_system_core.git system/core && cd system/core && git revert 9f5ec999c824840279c67ddf3e902b387ccc482f && git revert 51f077f61f9aa6e595be55ed094414f87479de68 && cd ../..

echo 'DONE'

echo 'Cloning oss Vibrator [6/6]'
# vendor/qcom/opensource/vibrator
git clone --depth=1 https://github.com/PixelExperience/vendor_qcom_opensource_vibrator -b thirteen  vendor/qcom/opensource/vibrator

echo 'Done and Completed'
