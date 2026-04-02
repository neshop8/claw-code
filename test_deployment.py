#!/usr/bin/env python3
"""Test script to verify Claw Code deployment"""

import sys
from pathlib import Path

# Add workspace to path
workspace = Path(__file__).parent
sys.path.insert(0, str(workspace))

from src.main import main

if __name__ == '__main__':
    # Run with test arguments
    result = main(['commands', '--limit', '3'])
    sys.exit(result)
