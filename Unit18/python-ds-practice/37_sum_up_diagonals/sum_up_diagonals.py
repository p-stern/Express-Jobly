def sum_up_diagonals(matrix):
    """Given a matrix [square list of lists], return sum of diagonals.

    Sum of TL-to-BR diagonal along with BL-to-TR diagonal:

        >>> m1 = [
        ...     [1,   2],
        ...     [30, 40],
        ... ]
        >>> sum_up_diagonals(m1)
        73

        >>> m2 = [
        ...    [1, 2, 3],
        ...    [4, 5, 6],
        ...    [7, 8, 9],
        ... ]
        >>> sum_up_diagonals(m2)
        30
    """

    sum = 0
    length = len(matrix[0])
    for x in range(0, length):
        sum = sum + matrix[x][x]
    x = 0
    for y in range(length - 1, -1, -1):
        sum = sum + matrix[x][y]
        x = x + 1
    return sum
