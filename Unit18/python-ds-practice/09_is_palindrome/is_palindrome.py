def is_palindrome(phrase):
    """Is phrase a palindrome?

    Return True/False if phrase is a palindrome (same read backwards and
    forwards).

        >>> is_palindrome('tacocat')
        True

        >>> is_palindrome('noon')
        True

        >>> is_palindrome('robert')
        False

    Should ignore capitalization/spaces when deciding:

        >>> is_palindrome('taco cat')
        True

        >>> is_palindrome('Noon')
        True
    """
    phrase_list = list(phrase.lower())
    phrase_forward = phrase_list.copy()
    phrase_reversed = phrase_list.copy()
    phrase_reversed.reverse()

    phrase_forward = [char for char in phrase_forward if char != ' ']
    phrase_reversed = [char for char in phrase_reversed if char != ' ']

    if phrase_forward == phrase_reversed:
        return True
    return False
