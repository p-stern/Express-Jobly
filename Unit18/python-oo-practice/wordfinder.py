"""Word Finder: finds random words from a dictionary."""


class WordFinder:
    """Returns random words from a file"""

    def __init__(self, file_path):
        self.file_path = file_path
        self.file1 = open(file_path, 'r')
        self.makelist()

    def makelist(self):
        self.wordlist = []
        self.count = 0
        for line in self.file1:
            self.count += 1
            self.wordlist.append(line.strip())
        print(f"{len(self.wordlist)} words read")

    def random(self):
        import random
        random_index = random.randint(0, len(self.wordlist)-1)
        return self.wordlist[random_index]
