#!/usr/bin/env python3
"""
Claw Code Rust Build Orchestrator for Windows
Automatically handles PATH, environment, and cargo build processes
"""

import os
import sys
import subprocess
import shutil
from pathlib import Path
from typing import Optional, Tuple


def find_cargo() -> Optional[str]:
    """Find cargo in standard locations or PATH"""
    # Standard Rust installation paths on Windows
    standard_paths = [
        Path.home() / ".cargo" / "bin" / "cargo.exe",
        Path("C:/Program Files/Rust stable MSVC 1.94.1/bin/cargo.exe"),
        Path("C:/Program Files/Rust stable GNU 1.94.1/bin/cargo.exe"),
        Path("C:/rustup/toolchains/stable-x86_64-pc-windows-msvc/bin/cargo.exe"),
    ]
    
    # Check standard paths first
    for path in standard_paths:
        if path.exists():
            print(f"✓ Found cargo at: {path}")
            return str(path)
    
    # Try to find via shutil.which (PATH search)
    cargo_path = shutil.which("cargo")
    if cargo_path:
        print(f"✓ Found cargo in PATH: {cargo_path}")
        return cargo_path
    
    print("✗ Cargo not found")
    return None


def setup_rust_path() -> Optional[str]:
    """Setup Rust paths in environment"""
    cargo_bin = Path.home() / ".cargo" / "bin"
    rust_home = Path.home() / ".rust"
    rustup_home = Path.home() / ".rustup"
    
    # Add to PATH if not already there
    current_path = os.environ.get("PATH", "")
    path_str = str(cargo_bin)
    
    if path_str not in current_path:
        os.environ["PATH"] = f"{path_str};{current_path}"
        print(f"✓ Added {cargo_bin} to PATH")
    
    # Set RUST environment variables
    os.environ["RUST_HOME"] = str(rust_home)
    os.environ["RUSTUP_HOME"] = str(rustup_home)
    os.environ["CARGO_HOME"] = str(cargo_bin.parent)
    
    return find_cargo()


def install_rust() -> bool:
    """Attempt to install Rust"""
    print("\n[*] Rust not found. Attempting installation...")
    print("[*] Please choose an option:")
    print("  1. Install Rust via Chocolatey (if available)")
    print("  2. Download Rust installer manually")
    print("  3. Use WSL2 with Linux Rust")
    print("")
    
    choice = input("Enter choice (1-3, or 'q' to quit): ").strip().lower()
    
    if choice == "1":
        # Try Chocolatey
        if shutil.which("choco"):
            print("[→] Installing Rust with Chocolatey...")
            result = subprocess.run(
                ["choco", "install", "-y", "rust-ms"],
                capture_output=False
            )
            return result.returncode == 0
        else:
            print("[!] Chocolatey not found")
            return False
    
    elif choice == "2":
        print("[→] Visit: https://www.rust-lang.org/tools/install")
        print("[→] Download and run the installer")
        print("[→] Restart this script after installation")
        return False
    
    elif choice == "3":
        print("[→] Install Rust in WSL2 and run build from there")
        return False
    
    elif choice.lower() == "q":
        return False
    
    else:
        print("[!] Invalid choice")
        return False


def build_rust(rust_dir: Path) -> bool:
    """Build Rust project"""
    cargo = setup_rust_path()
    
    if not cargo:
        print("\n[!] Cargo not found in PATH or standard locations")
        print("[!] Installing Rust...")
        if not install_rust():
            print("\n[!] Please install Rust manually from https://rustup.rs/")
            return False
        # Try again after installation
        cargo = find_cargo()
        if not cargo:
            print("[!] Still cannot find cargo after installation attempt")
            return False
    
    # Change to rust directory
    os.chdir(rust_dir)
    print(f"\n[→] Building in: {os.getcwd()}")
    print("[→] This will take 3-5 minutes...")
    print("")
    
    # Run the build
    try:
        result = subprocess.run(
            [cargo, "build", "--release", "-p", "claw-cli"],
            check=False
        )
        return result.returncode == 0
    except Exception as e:
        print(f"[!] Build failed: {e}")
        return False


def main():
    """Main entry point"""
    print("=" * 60)
    print(" Claw Code - Rust Build Orchestrator")
    print("=" * 60)
    print("")
    
    # Find root directory
    current_file = Path(__file__).resolve()
    if current_file.name == "build_orchestrator.py":
        root_dir = current_file.parent
    else:
        root_dir = Path.cwd()
    
    rust_dir = root_dir / "rust"
    
    if not rust_dir.exists():
        print(f"[!] Rust directory not found: {rust_dir}")
        return 1
    
    print(f"[✓] Found Rust project at: {rust_dir}")
    print("")
    
    # Build
    if build_rust(rust_dir):
        binary_path = rust_dir / "target" / "release" / "claw.exe"
        if binary_path.exists():
            print("\n" + "=" * 60)
            print(" ✓ Build Successful!")
            print("=" * 60)
            print(f"\n[✓] Binary created: {binary_path}")
            print("\n[→] Try running:")
            print(f"    {binary_path} --help")
            print(f"    {binary_path} prompt \"what is this workspace?\"")
            print("")
            return 0
    
    print("\n[!] Build failed")
    return 1


if __name__ == "__main__":
    sys.exit(main())
