def reverse_vowels(s):
    """Reverse vowels in a string.

    Characters which re not vowels do not change position in string, but all
    vowels (y is not a vowel), should reverse their order.

    >>> reverse_vowels("Hello!")
    'Holle!'

    >>> reverse_vowels("Tomatoes")
    'Temotaos'

    >>> reverse_vowels("Reverse Vowels In A String")
    'RivArsI Vewols en e Streng'

    reverse_vowels("aeiou")
    'uoiea'

    reverse_vowels("why try, shy fly?")
    'why try, shy fly?''
    """

    s_dict = {}
    i = 0
    for char in list(s):
        s_dict[i] = char
        i += 1

    vowel_dict = {}
    for i in range(0, len(s_dict)):
        if s_dict[i] in 'aeiouAEIOU':
            vowel_dict[i] = s_dict[i]

    vowel_list = list(vowel_dict.values())
    vowel_list.reverse()

    j = 0
    for i in range(0, len(s_dict)):
        if s_dict[i] in 'aeiouAEIOU':
            s_dict[i] = vowel_list[j]
            j += 1
    return "".join(s_dict.values())
