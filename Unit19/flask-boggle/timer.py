# Code based on:
# https://www.udacity.com/blog/2021/09/create-a-timer-in-python-step-by-step-guide.html

import time
import datetime
 
# Create class that acts as a countdown
def countdown(s):
 
    # Calculate the total number of seconds
    total_seconds = s
 
    # While loop that checks if total_seconds reaches zero
    # If not zero, decrement total time by one second
    while total_seconds > 0:
 
        # Timer represents time left on countdown
        timer = datetime.timedelta(seconds = total_seconds)
        
        # Prints the time left on the timer
        print(timer, end="\r")
 
        # Delays the program one second
        time.sleep(1)
 
        # Reduces total time by one second
        total_seconds -= 1
 
    print("Bzzzt! The countdown is at zero seconds!")
 
countdown(int(60))