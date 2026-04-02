#!/usr/bin/env python3
"""Setup configuration for Claw Code Python workspace."""

from setuptools import setup, find_packages

setup(
    name="claw-code",
    version="0.1.0",
    description="Python porting workspace for Claw Code harness engineering",
    author="Community",
    license="MIT",
    packages=find_packages(),
    python_requires=">=3.11",
    entry_points={
        "console_scripts": [
            "claw-python=src.main:main",
        ],
    },
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python :: 3.11",
    ],
)
