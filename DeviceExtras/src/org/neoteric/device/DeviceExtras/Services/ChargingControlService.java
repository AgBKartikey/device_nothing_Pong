/*
 * Copyright (C) 2024 Neoteric OS
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.neoteric.device.DeviceExtras;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import org.neoteric.device.DeviceExtras.FileUtils;

public class ChargingControlService extends Service {

    private static final String TAG = "ChargingControlService";
    private static final boolean DEBUG = true;

    private static final String USB_CHG_ONLINE = "/sys/class/power_supply/usb/online";
    private static final String WLS_CHG_ONLINE = "/sys/class/power_supply/wireless/online";
    private static final String USB_CHG_TYPE = "/sys/class/power_supply/usb/usb_type";
    private static final String BATTERY_TEMP = "/sys/class/thermal/thermal_zone96/temp";
    private static final String WLS_TEMP = "/sys/class/thermal/thermal_zone76/temp";
    private static final String BATTERY_SCENARIO_FCC = "/sys/class/qcom-battery/scenario_fcc";
    private static final int[] CHG_VOLT_TBL = { 9000, 8500, 8000, 7500, 7000, 6500, 
                                              6000, 5500, 5000, 4500, 4000, 3500, 
                                              3000, 2500, 2400, 2000, 1600, 1500, 
                                              1200, 1000, 500, 0 };

    private static ScheduledExecutorService scheduler;

    @Override
    public void onCreate() {
        if (DEBUG) Log.d(TAG, "Creating service");
        scheduler = Executors.newScheduledThreadPool(1);
        Runnable chargeLimitTask = new Runnable() {
            @Override
            public void run() {
                limitCharge();
            }
        };
        scheduler.scheduleAtFixedRate(chargeLimitTask, 0, 500, TimeUnit.MILLISECONDS);
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (DEBUG) Log.d(TAG, "Starting service");
        return START_STICKY;
    }

    @Override
    public void onDestroy() {
        if (DEBUG) Log.d(TAG, "Destroying service");
        scheduler.shutdown();
        FileUtils.writeValue(BATTERY_SCENARIO_FCC, Integer.toString(CHG_VOLT_TBL[0]));
        super.onDestroy();
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    private static void limitCharge() {
        boolean usbChgActive = FileUtils.getFileValueAsBoolean(USB_CHG_ONLINE, false);
        boolean wlsChgActive = FileUtils.getFileValueAsBoolean(WLS_CHG_ONLINE, false);
        int last_volt_limit = Integer.parseInt(FileUtils.readLine(BATTERY_SCENARIO_FCC));
        int volt_limit_index = 0;

        if (usbChgActive) {
            int batteryTemp = Integer.parseInt(FileUtils.readLine(BATTERY_TEMP));
            String usbChgType = FileUtils.readLine(USB_CHG_TYPE);
            int[] mTempThresholds;
            int[] mVoltLimit;
            if (usbChgType.contains("[PD_PPS]")) {
                int[] tempThresholds = { 35000, 37000, 39000, 41000, 43000, 48000 };
                int[] voltLimit = { 4, 6, 10, 12, 15, 21 };
                mTempThresholds = tempThresholds;
                mVoltLimit = voltLimit;
            } else {
                int[] tempThresholds = { 35000, 37000, 39000, 41000, 48000 };
                int[] voltLimit = { 8, 12, 15, 16, 21 };
                mTempThresholds = tempThresholds;
                mVoltLimit = voltLimit;
            }
            for (int i = 0; i < mTempThresholds.length; i++) {
                if (batteryTemp < mTempThresholds[i]) {
                    break;
                } else if (batteryTemp >= mTempThresholds[i]) {
                    volt_limit_index = mVoltLimit[i];
                }
            }
        } else if (wlsChgActive) {
            int wlsTemp = Integer.parseInt(FileUtils.readLine(WLS_TEMP));
            int[] tempThresholds = { 35000, 41000, 48000 };
            int[] voltLimit = { 15, 19, 21 };

            for (int i = 0; i < tempThresholds.length; i++) {
                if (wlsTemp < tempThresholds[i]) {
                    break;
                } else if (wlsTemp >= tempThresholds[i]) {
                    volt_limit_index = voltLimit[i];
                }
            }
        }

        if (usbChgActive || wlsChgActive) {
            int current_volt_limit = CHG_VOLT_TBL[volt_limit_index];
            if (current_volt_limit == last_volt_limit)
                return;
            FileUtils.writeValue(BATTERY_SCENARIO_FCC, Integer.toString(current_volt_limit));
        }
    }
}
