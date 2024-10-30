# RareLS
RareLS: Rarity-Reducing Logic Synthesis for Mitigating Hardware Trojan Threats

RareLS is used to reduce the number of rare signals in logic circuit to protect the circuit from hardware trojan attacks.
RareLS makes it harder for attackers to insert hardware trojans and makes it easier for defenders to detect hardware trojans.
RareLS's overall flow is shown below:
<img src="fig/rarels.jpg" alt="flow" style="zoom: 100%;" />

For more details, you can refer to the following paper:
[Chang Meng, Mingfei Yu, Hanyu Wang, Wayne Burleson, and Giovanni De Micheli, "*RareLS: Rarity-Reducing Logic Synthesis for Mitigating Hardware Trojan Threats*," in International Conference on Computer-Aided Design (ICCAD), New Jersay, USA, 2024.](paper/ICCAD_2024_RareLS__Rare_Reducing_Logic_Synthesis_for_Mitigating_Hardware_Trojan_Threats.pdf)


## Dependencies 

- Reference environment, **Ubuntu 20.04 LTS** with the following tools and libraries:

  - Tools: gcc 10.3.0 & g++ 10.3.0 & [cmake](https://cmake.org/) 3.16.3

    You can install these tools with the following command:

    ```shell
    sudo apt install gcc-10
    sudo apt install g++-10
    sudo apt install cmake
    ```

    You also need to check whether the default versions of gcc and g++ are 10.3.0:

    ```shell
    gcc --version
    g++ --version
    ```

    If the default versions of gcc and g++ are not 10.3.0, please change them to 10.3.0.

  - Libraries: [libboost](https://www.boost.org/) 1.74.0, libreadline 8.0-4, libgmp, libmpfr, libmpc

    You can install these libraries with the following command:

    ```shell
    sudo apt install libboost1.74-all-dev
    sudo apt install libreadline-dev
    sudo apt install libgmp-dev
    sudo apt-get install libmpfr-dev
    sudo apt-get install libmpc-dev

## Download

RareLS contains a submodule: open-source logic synthesis and verification tool abc

```shell
git clone --recursive https://github.com/changmg/RareLS.git
```

Please do add the argument "--recursive" to ensure that the submodule abc is cloned.

## Build

- To build, go to the root directory of the project, and then execute:

```shell
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make
cd ..
```

If you compile successfully, you will obtain the following two executable programs:

1. rarels_aig_synthesis, performing rarity reducing AIG synthesis
2. rarels_map, performing rarity reducing technology mapping

## Execute

Examples:

```shell
./rarels_aig_synthesis input/benchmark/abc-optimized/c0499_init.aig 
```

This command takes c0499_init.aig as the input AIG, reduce the number of rare signals in the AIG

```shell
./rarels_map --rareSignalThreshold 0.1 --inputBlif ./input/benchmark/abc-optimized/c0499_init.blif
```

This command takes an optimized AIG c0499_init.blif as input, and then performs rarity-reducing technology mapping.