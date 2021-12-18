import unittest
import test
import swift

class MyTestCase1(unittest.TestCase):

    # Only use setUp() and tearDown() if necessary

    def setUp(self):
        # Nothing
        print("setting up")

    def tearDown(self):
        # Nothing
        print("tearing down")

    def test_feature_one(self):
        # Test feature one.
        swift.run()
        print("hello world testing feature one")

if __name__ == '__main__':
    unittest.main()
