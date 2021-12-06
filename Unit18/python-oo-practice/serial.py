"""Python serial number generator."""


class SerialGenerator:
    """Machine to create unique incrementing serial numbers.

    >>> serial = SerialGenerator(start=100)

    >>> serial.generate()
    100

    >>> serial.generate()
    101

    >>> serial.generate()
    102

    >>> serial.reset()

    >>> serial.generate()
    100
    """

    def __init__(self, start):
        """Iniitialize SerialGenerator"""
        self.start = start
        self.num = self.start - 1

    def __repr__(self):
        """SerialGenerator description"""
        nextnum = self.num + 1
        if nextnum == self.num:
            nextnum = self.num + 1
        return f"<SerialGenerator start={self.start} next={nextnum}>"

    def generate(self):
        """Increment and return self.num"""
        self.num += 1
        return self.num

    def reset(self):
        """Reset number to initialized value"""
        self.num = self.start - 1
