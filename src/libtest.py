"""
    Use rust code in Python 3
"""

import ctypes

ADDER = ctypes.CDLL('target/debug/liblibrst1.dylib')
print(ADDER.add(321, 123))
