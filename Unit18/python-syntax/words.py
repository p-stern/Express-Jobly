def print_upper_words(words, must_start_with):
    """print one word per line in uppercase, must start with one of the must_start_with parameters"""

    for word in words:
        for letter in must_start_with:
            if word[0].upper() == letter.upper():
                print(word.upper())
