# Android device tree for Multilaser M7sLite (ML-SO06-M7sLite)


This repository contains the Team Win Recovery Project (TWRP) device tree for the **Multilaser M7s Lite (Model NB296)**. This configuration was built using engineering reverse-methods on the stock recovery ramdisk and kernel parameters.

---

## 📊 Device Specifications


| Feature | Details |
| :--- | :--- |
| **Device Brand** | Multilaser (Brazil) |
| **Model** | M7s Lite (NB296) - 2019 Version |
| **SoC** | Allwinner A50 (sun8iw15) |
| **CPU** | Quad-Core ARM Cortex-A7 @ 1.8GHz |
| **Architecture** | 32-bit (ARMv7-A / armv7l) |
| **GPU** | ARM Mali-400 MP2 |
| **RAM** | 1 GB LPDDR3 |
| **Storage** | 16 GB eMMC |
| **Display Panel** | 7.0" TN LCD / 600x1024 Resolution (Portrait) |
| **Stock OS** | Android 8.1 Oreo (Go Edition) |
| **Current Tested GSI** | LineageOS 17.1 Unofficial (Android 10) |
| **Linux Kernel** | 4.9.56 |

---

## 🛠️ How to Compile TWRP for sun8iw15

To build a functional TWRP recovery image from this source tree, you must initialize a minimal manifest environment (OmniROM or Minimal TWRP source trees) on a Linux Build Station (Ubuntu 20.04/22.04 LTS or Windows WSL2).

### 1. Initialize Repo and Sync Source

Ensure your development environment has `repo` and dependencies installed, then initialize the minimal manifest for TWRP (Android 10.0 branch):

```bash
# Create working directory
mkdir twrp-minimal && cd twrp-minimal

# Initialize Minimal TWRP source tree (Android 10 branch)
repo init --depth=1 -u https://github.com -b twrp-10.0

# Sync the repositories (this will download around 30GB-40GB of data)
repo sync -c -j$(nproc) --force-sync --no-clone-bundle --no-tags
```

### 2. Clone this Device Tree

After syncing the manifest, you must clone this specific repository into your workspace under the correct path matching the `AndroidProducts.mk` definitions:

```bash
# Create the target manufacturer directory
mkdir -p device/multilaser/ML-SO06-M7sLite

# Clone this repository into the workspace
git clone https://github.com/TheRicardx/android_device_multilaser_M7sLite/tree/main

```

### 3. Execution and Compilation Commands

Run the AOSP build system script variables to prepare the environment compilation toolchain, select the target device profile, and build the recovery binary output:

```bash
# Initialize build environment parameters
source build/envsetup.sh

# Select the target compilation profile (eng = Engineer debug mode)
lunch omni_ML-SO06-M7sLite-eng

# Start compilation forcing missing dependencies safety protocols
mka recoveryimage ALLOW_MISSING_DEPENDENCIES=true
```

### 💾 Compilation Outputs

Once the AOSP toolchain completes compilation processes, the final flashable partition binary image will be exported into the output build folder:
* Output location: `out/target/product/ML-SO06-M7sLite/recovery.img`

---

## 📌 Development Notes & Hardware Safety Warnings

* ⚠️ **HARD-BRICK WARNING:** Do not attempt to use or flash configurations designed for MTK architectures (such as MediaTek MT8167B or MT8765 tokens found in newer Multilaser M8 units) over this platform. This tree is strictly compiled for Allwinner sun8iw15 layouts.
* 📦 **Ramdisk Unpacking:** The extraction layer was processed successfully using the Android Image Kitchen (AIK) utilities built inside the `twrpdtgen` automation script engines.
* 📱 **Resolution Setup:** Custom partition handling arrays inside `BoardConfig.mk` match the raw 600x1024 resolution geometry. Screen alignment frameworks require portrait panel configurations to display UI assets correctly without causing display panel distortions or color inversion issues.

---

## 📜 Open Source Licensing and Framework Credits

* **Core Base:** Android Open Source Project (AOSP) & Team Win Recovery Project.
* **Automation Porting Engines:** Generated via SebaUbuntu's TWRP Device Tree Generator tools.
* **Licensing Standards:** All parameters distributed under Apache License Version 2.0 regulations. 

