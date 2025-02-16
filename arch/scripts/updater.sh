#!/bin/zsh

LOG_FILE="/tmp/pacman-update.log"

# Updates the system. It will create a temporal log file to store the output of the process.
echo "🔄 Starting system update..."
if sudo pacman -Syu | tee "$LOG_FILE"; then
    echo "✅ System update completed successfully."
else
    echo "❌ System update failed. Check $LOG_FILE for details."
    exit 1
fi

# Checks if the NVIDIA driver was updated by checking the log file. If so, it regenerates the initramfs.
if grep -qi "nvidia" "$LOG_FILE"; then
    echo "⚠️ NVIDIA driver update detected!"
    echo "🔧 Regenerating the initramfs with 'mkinitcpio -P'..."
    if sudo mkinitcpio -P; then
        echo "✅ Successfully regenerated the initramfs."
    else
        echo "❌ Failed to regenerate the initramfs."
        exit 1
    fi
else
    echo "✅ No NVIDIA driver update detected. Proceeding..."
fi

# Updates the Rust toolchain.
echo "🦀 Updating Rust toolchain..."
if rustup update; then
    echo "✅ Rust toolchain updated successfully."
else
    echo "❌ Rust update failed."
    exit 1
fi

echo "🎉 All updates completed successfully!"
