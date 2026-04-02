#!/usr/bin/env python3
"""Wrapper to fix sys.path and launch main.py"""
import sys
from pathlib import Path

# Add the parent directory to sys.path to ensure standard library modules take precedence
parent_dir = str(Path(__file__).parent.parent)
if parent_dir not in sys.path:
    sys.path.insert(0, parent_dir)

# Now import and run main
from src.main import main
if __name__ == '__main__':
    main()
