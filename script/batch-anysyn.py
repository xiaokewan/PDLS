import os


# enumerate all .blif files in the folder
benchmarks = []
# folder = './input/benchmark/iscas85-dc-optimized'
# folder = './input/benchmark/abc-optimized'
folder = './input/benchmark/change-delta-input'
# folder = './input/benchmark/epfl-original/random_control'
# folder = './input/benchmark/epfl-original/arithmetic'
for file in os.listdir(folder):
    if file.endswith('.aig'):
        benchmarks.append(os.path.join(folder, file))

benchmarks.sort()

# print(benchmarks)


# ./build/experiments/anysyn_reduce_rare_signals <benchmark>
for benchmark in benchmarks:
    comm = './build/mockturtle-mini/experiments/anysyn_reduce_rare_signals ' + benchmark
    # print(comm)
    os.system(comm)
    # print('')
    # print('')