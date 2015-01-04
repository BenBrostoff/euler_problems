import unittest
from bin_gen import *

class TestSequenceFunctions(unittest.TestCase):
    def test_to_bin(self):
        self.assertEqual(to_bin(1), 1)
        self.assertEqual(to_bin(4), 100)
        self.assertEqual(to_bin(7), 111)
        self.assertEqual(to_bin(324), 101000100)

    def test_from_bin(self):
        self.assertEqual(to_bin(1), 1)
        self.assertEqual(to_bin(4), 100)
        self.assertEqual(to_bin(7), 111)
        self.assertEqual(to_bin(324), 101000100)

if __name__ == '__main__':
    unittest.main()
