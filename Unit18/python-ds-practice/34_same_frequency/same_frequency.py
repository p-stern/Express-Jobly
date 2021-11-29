def same_frequency(num1, num2):
    """Do these nums have same frequencies of digits?

        >>> same_frequency(551122, 221515)
        True

        >>> same_frequency(321142, 3212215)
        False

        >>> same_frequency(1212, 2211)
        True
    """
    num1_list = list(str(num1))
    num2_list = list(str(num2))

    num1_list.sort()
    num2_list.sort()

    sorted_num1 = "".join(num1_list)
    sorted_num2 = "".join(num2_list)

    if sorted_num1 == sorted_num2:
        return True
    return False
