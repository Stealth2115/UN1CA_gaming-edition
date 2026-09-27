# Copyright (c) 2025 Salvo Giangreco
# SPDX-License-Identifier: GPL-3.0-or-later

# Debloat list for Galaxy S21+ 5G (Exynos) (t2s)
# - Add entries inside the specific partition containing that file (<PARTITION>_DEBLOAT+="")
# - DO NOT add the partition name at the start of any entry (eg. "/system/dpolicy_system")
# - DO NOT add a slash at the start of any entry (eg. "/dpolicy_system")

# Overlays
SYSTEM_DEBLOAT+="
system/app/WifiRROverlayAppH2E
system/app/Rubin
system/priv-app/Rubin
system/app/MultiControl
system/priv-app/MultiControl
system/app/HWResourceShare
system/priv-app/HWResourceShare
product/app/HWResourceShare
product/priv-app/HWResourceShare
"
