# Comparative Analysis of Prime Number Generation in Python and Assembly
  
## Abstract
This research project aims to compare the performance and implementation complexity of prime number generation algorithms in Python and Assembly programming languages. The study focuses on assessing the execution time, memory usage, and code flexibility associated with prime number generation in both languages within the range of 1 to 99999.
  
## Objectives
Implement a prime number generation algorithm (e.g., Sieve of Eratosthenes) in both Python and Assembly languages. Measure and compare the execution time and memory usage of the implemented algorithms. Analyze the code flexibility, readability, and adaptability to variations in the prime number generation task for both languages. Present the findings in a comprehensive report to contribute insights into the trade-offs between performance and flexibility in Python and Assembly programming.  
  
## Solution
`sieve.py` contains the Python implementation. It is annotated with comments.  
  
`sieve.asm` contains the Assembly x86 implemetation. You can run it with NASM in Ubuntu. It is not guaranteed to work with other Operating Systems or compilers!

## Results
We run both codes 1000 times and averaged out the results. It took 2.959 seconds on average for the assembly code to finish, while it took 5.298 for the Python code to perform the same task.
