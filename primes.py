from datetime import datetime

def SieveOfEratosthenes(num):
    # Initialize a boolean list to True for all numbers up to 'num'
    sieve = [True for i in range(num+1)]
    p = 2
    
    # Iterate through numbers starting from 2 up to the square root of 'num'
    while (p * p <= num):
        # If 'p' is still marked as prime
        if (sieve[p] == True):
            # Mark all multiples of 'p' as non-prime
            for i in range(p * p, num+1, p):
                sieve[i] = False
        p += 1

if __name__ == '__main__':
    # Set the maximum number to 10000 and the number of tries to 1000
    max_num = 10000
    num_tries = 1000

    # Record the start time
    start = datetime.now()

    # Run the SieveOfEratosthenes function 'num_tries' times
    for i in range(num_tries):
        SieveOfEratosthenes(max_num)

    # Record the end time
    end = datetime.now()

    # Calculate the average time taken for each try
    avg_time = (end - start) / num_tries

    # Print the average time in seconds
    print(avg_time.microseconds / 1000000)
