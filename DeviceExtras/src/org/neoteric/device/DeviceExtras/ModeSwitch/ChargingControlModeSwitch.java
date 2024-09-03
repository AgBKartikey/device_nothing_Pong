/*
* Copyright (C) 2016 The OmniROM Project
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program. If not, see <http://www.gnu.org/licenses/>.
*
*/
package org.neoteric.device.DeviceExtras;

import androidx.preference.Preference;
import androidx.preference.Preference.OnPreferenceChangeListener;

import android.content.Intent;
import android.os.UserHandle;

import org.neoteric.device.DeviceExtras.ChargingControlService;

public class ChargingControlModeSwitch implements OnPreferenceChangeListener {

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        Boolean enabled = (Boolean) newValue;
        if (enabled) {
            DeviceExtras.CONTEXT.startServiceAsUser(new Intent(DeviceExtras.CONTEXT, ChargingControlService.class),
                UserHandle.CURRENT);
        } else {
            DeviceExtras.CONTEXT.stopServiceAsUser(new Intent(DeviceExtras.CONTEXT, ChargingControlService.class),
                UserHandle.CURRENT);
        }
        return true;
    }
}
