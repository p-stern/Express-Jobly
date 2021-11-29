def two_list_dictionary(keys, values):
    """Given keys and values, make dictionary of those.

        >>> two_list_dictionary(['x', 'y', 'z'], [9, 8, 7])
        {'x': 9, 'y': 8, 'z': 7}

    If there are fewer values than keys, remaining keys should have value
    of None:

        >>> two_list_dictionary(['a', 'b', 'c', 'd'], [1, 2, 3])
        {'a': 1, 'b': 2, 'c': 3, 'd': None}

    If there are fewer keys, ignore remaining values:

        >>> two_list_dictionary(['a', 'b', 'c'], [1, 2, 3, 4])
        {'a': 1, 'b': 2, 'c': 3}
    """
    dict = {}
    key_length = len(keys)
    values_length = len(values)
    if key_length <= values_length:
        for k in range(0, key_length):
            dict.update({keys[k]: values[k]})
    else:
        for k in range(0, values_length):
            dict.update({keys[k]: values[k]})
        for v in range(values_length, key_length):
            dict.update({keys[v]: None})
    return dict
