import os

# enumerate all .blif files in the folder
benchmarks = []
folder = './result/tmp/'
for file in os.listdir(folder):
    if file.endswith('.blif'):
        benchmarks.append(os.path.join(folder, file))
benchmarks.sort()
# print(benchmarks)
# assert 0

# rareSignalThreshold = 0.05
# rareSignalThreshold = 0.1
# rareSignalThreshold = 0.15
rareSignalThreshold = 0.2
nFrame = 1048576

for benchmark in benchmarks:
    # if benchmark.find('adder') != -1 or benchmark.find('bar') != -1 or benchmark.find('sqrt') != -1:
    #     rareSignalThreshold = 0.25
    # else:
    #     rareSignalThreshold = 0.1
    if benchmark.find('hyp') != -1:
        nFrame = 102400
    else:
        nFrame = 1048576
    comm = f'./als.out --seed 2023112000 --nFrame {nFrame} --rareSignalThreshold {rareSignalThreshold} --outpPath {folder}/mapped --accCirc {benchmark}'
    # print(comm)
    os.system(comm)