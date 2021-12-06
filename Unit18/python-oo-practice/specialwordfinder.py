from wordfinder import WordFinder

"""Special Word Finder: finds random words from a dictionary.    """


class SpecialWordFinder(WordFinder):
    """Returns random words from a file

    >>> swf = SpecialWordFinder("words2.txt")
    4 words read

    >>> swf.random() in ["kale", "parsnips", "apple", "mango"]
    True
    >>> swf.random() in ["kale", "parsnips", "apple", "mango"]
    True
    >>> swf.random() in ["kale", "parsnips", "apple", "mango"]
    True
    >>> swf.random() in ["kale", "parsnips", "apple", "mango"]
    True
    """

    def __init__(self, file_path):
        self.file_path = file_path
        self.file1 = open(file_path, 'r')
        self.makelist()

    def makelist(self):
        """Make wordlist that skipps blanks and comments in file"""
        self.wordlist = []
        self.count = 0
        for line in self.file1:
            if len(line.strip()) > 0 and line[0] != '#':
                self.count += 1
                self.wordlist.append(line.strip())
        print(f"{len(self.wordlist)} words read")

    def random(self):
        """Call wordfinder.py random() method"""
        return super().random()
