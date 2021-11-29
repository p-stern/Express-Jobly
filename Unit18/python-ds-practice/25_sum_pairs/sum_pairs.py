def sum_pairs(nums, goal):
    """Return tuple of first pair of nums that sum to goal.

    For example:

        >>> sum_pairs([1, 2, 2, 10], 4)
        (2, 2)

    (4, 2) sum to 6, and come before (5, 1):

        >>> sum_pairs([4, 2, 10, 5, 1], 6) # (4, 2)
        (4, 2)

    (4, 3) sum to 7, and finish before (5, 2):

        >>> sum_pairs([5, 1, 4, 8, 3, 2], 7)
        (4, 3)

    No pairs sum to 100, so return empty tuple:

        >>> sum_pairs([11, 20, 4, 2, 1, 5], 100)
        ()
    """
    ind1 = -1
    ind2 = -1
    for num1_ind in range(0, len(nums)):
        for num2_ind in range(num1_ind + 1, len(nums)):
            if nums[num1_ind] + nums[num2_ind] == goal:
                if ind1 == -1 or num2_ind < ind2:
                    ind1 = num1_ind
                    ind2 = num2_ind

    if ind1 == -1:
        return ()
    return (nums[ind1], nums[ind2])
