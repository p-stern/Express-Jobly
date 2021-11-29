def valid_parentheses(parens):
    """Are the parentheses validly balanced?

        >>> valid_parentheses("()")
        True

        >>> valid_parentheses("()()")
        True

        >>> valid_parentheses("(()())")
        True

        >>> valid_parentheses(")()")
        False

        >>> valid_parentheses("())")
        False

        >>> valid_parentheses("((())")
        False

        >>> valid_parentheses(")()(")
        False
    """

    left = 0
    right = 0
    paren_list = list(parens)
    if len(paren_list) % 2 != 0:
        return False
    for paren in paren_list:
        if paren == '(':
            left += 1
        else:
            right += 1
        if right > left:
            return False
    return True
