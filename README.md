# Lab-2

##Answer 1:
For the first question we were requested to search through the simulation files and find gem5's default values for our processor's Data Cache size and associativity, Instruction Cache size and associativity, Level 2 Cache size and associativity as well as the cache line size. Since the CPU model used was the same (MinorCPU) across all benchmarks we need only look at one of the files to determine the previous characteristics.
| DCache Size | ICache Size | DCache Associativity | ICache Associativity | L2 Size | L2 Associativity | Cache Line Size |
|-------------|-------------|----------------------|----------------------|---------|------------------|-----------------|
| [65536 B]() | [32768 B]() | [2]() | [2]() | [20870152 B]() | [8]() | [64]() |

We also took note of the execution times, CPI and the various cache miss rates for our benchmarks and compiled the following graphs to help us compare:

###_Insert Graphs_

It is apparent that the chess simulation benchmark (sjeng) has the highest overall CPI and execution time. That is a result of the massive amount of data cache and level 2 misses which probably occur due to the binary tree traversals that happen within the benchmark's code (very low locality). **_Append_**

Finally, we tested for the effects of the system and CPU clocks on the benchmarks. We found out that all CPU cores have the same frequency, which is equal to the value of cpu_cluster.clk_domain.clock. Other than the frequency of the processing units, cpu_cluster.clk_domain.clock also defines the frequency of our L1 and 2 caches. The system.clk_domain.clock defines the frequency of all other components of the simulated machine as well as the communication speed between them. This variable seems to be constant and equal to 1GHz.  
We also tested for the scalability of the benchmarks according to the CPU clock frequency and the results differ between the various benchmarks. For bzip... For mcf... For sjeng... For libm the scalability is quite good, when applying a 3GHz clock the number of simulated seconds becomes 0.35 as many as those for 1GHz which is relatively close to the expected 0.333.

##Answer 2:
For the next step of the excersize we were requested to make an attempt at finding optimal architecture for each benchmark by minimizing the CPI and chache misses. Of course, running haphazard experiments for random values for each and every one of our given variables would take too much time even with the limits we were given. The algorithm we came up to reduce time was the following: We would first check each variable individually to see how large of an effect it has on our execution. Afterwards we ordered each vaible for each program by order of importance and run experiments optimizing one variable each time. That should have been sufficient for us to find the optimum had our variables been completely independent. We are aware however that such a thing is untrue, we consider groups our variables to be lightly dependent, to be more specific each cache should be dependent on the corresponding associativity, also, caches of the same level should also be dependent on eachother's size and cache line size should be correlated with all other variables. Keeping that in mind we executed a few extra experiments to see if that light dependence was enough to through our results off at any point and made any needed corrections.

##Answer 3:
