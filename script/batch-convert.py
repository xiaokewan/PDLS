import os


# enumerate all .blif files in the folder
benchmarks = []
# folder = './input/benchmark/abc-optimized/'
folder = './input/benchmark/change-delta-input/'
for file in os.listdir(folder):
    if file.endswith('.v'):
        benchmarks.append(os.path.join(folder, file))
benchmarks.sort()
# print(benchmarks)
# assert 0

# rareSignalThreshold = 0.05
# rareSignalThreshold = 0.15
rareSignalThreshold = 0.2

for benchmark in benchmarks:
    comm = f'./als.out --seed 2023112000 --nFrame 1048576 --rareSignalThreshold {rareSignalThreshold} --outpPath {folder} --measureMode --accCirc {benchmark}'
    # print(comm)
    os.system(comm)