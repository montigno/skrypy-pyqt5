#!/usr/bin/env bash
set -e

echo "=== Detecting OS ==="

OS="$(uname -s)"

if [[ "$OS" == "Darwin" ]]; then
    PLATFORM="macos"
elif [[ "$OS" == "Linux" ]]; then
    PLATFORM="linux"
else
    echo "Unsupported OS: $OS"
    exit 1
fi

echo "Platform: $PLATFORM"

echo
echo "=== Detecting package manager ==="

PKG_MANAGER=""

if [[ "$PLATFORM" == "macos" ]]; then
    if command -v brew &> /dev/null; then
        PKG_MANAGER="brew"
    else
        echo "Homebrew not found. Install it first: https://brew.sh"
        exit 1
    fi
else
    if command -v apt &> /dev/null; then
        PKG_MANAGER="apt"
    elif command -v dnf &> /dev/null; then
        PKG_MANAGER="dnf"
    elif command -v pacman &> /dev/null; then
        PKG_MANAGER="pacman"
    else
        echo "Unsupported Linux distribution."
        exit 1
    fi
fi

echo "Using package manager: $PKG_MANAGER"

install_packages() {
    case $PKG_MANAGER in
        brew)
            brew install python rsync
            ;;
        apt)
            sudo apt update
            sudo apt install -y python3 python3-venv python3-pip python3-tk rsync
            ;;
        dnf)
            sudo dnf install -y python3 python3-virtualenv python3-pip python3-tkinter rsync
            ;;
        pacman)
            sudo pacman -Sy --noconfirm python python-pip python-virtualenv tk rsync
            ;;
    esac
}

echo
echo "=== Searching for Python >= 3.10 ==="

check_python_version() {
    "$1" - <<EOF
import sys
exit(0 if sys.version_info >= (3,10) else 1)
EOF
}

PYTHON=""

for cmd in python3 python py python3.12 python3.11 python3.10; do
    if command -v "$cmd" &> /dev/null && check_python_version "$cmd"; then
        PYTHON="$cmd"
        break
    fi
done

if [[ -z "$PYTHON" ]]; then
    echo "Python >= 3.10 not found. Installing..."
    install_packages

    for cmd in python3 python; do
        if command -v "$cmd" &> /dev/null && check_python_version "$cmd"; then
            PYTHON="$cmd"
            break
        fi
    done

    if [[ -z "$PYTHON" ]]; then
        echo "Python installation failed."
        exit 1
    fi
fi

echo "Using Python: $PYTHON"
"$PYTHON" --version

echo
echo "=== Pip verification ==="
"$PYTHON" -m pip --version &> /dev/null || "$PYTHON" -m ensurepip --upgrade

echo
echo "=== tkinter verification ==="
if ! "$PYTHON" -c "import tkinter" &> /dev/null; then
    echo "tkinter missing (may require reinstall Python with Tk support)."
    install_packages
fi

echo
echo "=== venv verification ==="
if ! "$PYTHON" -m venv --help &> /dev/null; then
    echo "venv missing. Installing..."
    install_packages
fi

echo
echo "=== Paths setup ==="

BASE="$HOME/Applications/skrypy_venv"
SOURCE="$(dirname "$0")/skrypy-pyqt5"
DEST="$BASE/skrypy-pyqt5"

echo
echo "=== Creating virtual environment ==="
if [[ ! -d "$BASE" ]]; then
    "$PYTHON" -m venv "$BASE"
    echo "Virtual environment created."
fi

echo
echo "=== Copy files ==="
mkdir -p "$DEST"
rsync -a --delete "$SOURCE/" "$DEST/"

echo "Copy finished."

echo
echo "=== Installing Python modules ==="
source "$BASE/bin/activate"
python "$DEST/install_modules.py"

echo
echo "=== Creating shortcut ==="

if [[ "$PLATFORM" == "linux" ]]; then
    DESKTOP_FILE="$HOME/.local/share/applications/skrypy.desktop"
    mkdir -p "$(dirname "$DESKTOP_FILE")"

    cat > "$DESKTOP_FILE" <<EOL
[Desktop Entry]
Version=1.0
Name=Skrypy
Comment=Skrypy Application
Exec=$BASE/bin/python $DEST/main.py
Path=$DEST
Icon=$DEST/ressources/skrypy.png
Terminal=true
Type=Application
Categories=Utility;
EOL

    chmod +x "$DESKTOP_FILE"
    echo "Linux shortcut created."

elif [[ "$PLATFORM" == "macos" ]]; then
    echo "Creating macOS .app launcher..."

    APP_DIR="$HOME/Applications/Skrypy.app"
    BIN_DIR="$APP_DIR/Contents/MacOS"
    RES_DIR="$APP_DIR/Contents/Resources"

    mkdir -p "$BIN_DIR"
    mkdir -p "$RES_DIR"

    # Script de lancement
    cat > "$BIN_DIR/skrypy" <<EOL
#!/bin/bash
cd "$DEST"
source "$BASE/bin/activate"
exec python "$DEST/main.py"
EOL

    chmod +x "$BIN_DIR/skrypy"

    # Info.plist (obligatoire pour macOS)
    cat > "$APP_DIR/Contents/Info.plist" <<EOL
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
 "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleName</key>
    <string>Skrypy</string>
    <key>CFBundleExecutable</key>
    <string>skrypy</string>
    <key>CFBundleIdentifier</key>
    <string>com.skrypy.app</string>
    <key>CFBundleVersion</key>
    <string>1.0</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
</dict>
</plist>
EOL

    echo "macOS app created at: $APP_DIR"
fi

echo
echo "=== Optional desktop shortcut ==="

if [[ "$PLATFORM" == "linux" ]]; then
    cp "$DESKTOP_FILE" "$HOME/Desktop/Skrypy.desktop" 2>/dev/null || true
    chmod +x "$HOME/Desktop/Skrypy.desktop" 2>/dev/null || true
fi

echo
echo "=== Installation finished ==="
