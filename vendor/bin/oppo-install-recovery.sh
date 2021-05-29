#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:d1a686a2456cb2ae3e83b60227a4f7a0c920efcf; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:4ce6b9260cbf472552d3c685d817ee0b4eff1042 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:d1a686a2456cb2ae3e83b60227a4f7a0c920efcf && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
