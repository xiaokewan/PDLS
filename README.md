# InterconnLS

InterconnLS: Interconnect-aware Logic Synthesis with Rent’s Rule Constraints

This tool adds Rent’s Rule–based interconnect constraints into logic synthesis optimization.  
The idea is: for a logic network, the expected number of terminals (inputs + outputs) of a subcircuit follows:

\[
T = t \times B^r
\]

- **T**: number of external terminals (fanins + outputs)  
- **B**: number of logic blocks (gates) in the subcircuit  
- **t**: average terminals per block (default = 3.0 for AIG)  
- **r**: Rent exponent (default = 0.5)  

If the actual number of terminals deviates too much from the expected \(T\), a **penalty** is added into the cost function.  
This way, the optimizer tends to select structures with better interconnect properties.  

---

## Build

```bash
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make
cd ..
```

---

## Usage

Run the rent-aware synthesis on an input AIG:

```bash
./interconnls_aig_synthesis <input_aig> [options]
```

### Example

```bash
./interconnls_aig_synthesis input/benchmark/abc-optimized/c0880_init.aig \
  --rent_r 0.55 \
  --rent_t 3.0 \
  --rent_slack 0.15 \
  --rent_weight 2.0 \
  --enforce_rent 1
```

---

## Options

- `--rent_r <float>` : Rent exponent (default = 0.5)  
- `--rent_t <float>` : Average terminals per gate (default = 3.0)  
- `--rent_slack <float>` : Allowed relative deviation before penalty (default = 0.10)  
- `--rent_weight <float>` : Weight of penalty (default = 1.0)  
- `--enforce_rent <0|1>` : Enable (1) or disable (0) Rent constraint (default = 1)  

---

## Output

- Optimized AIG is written into `./tmp/<benchmark>_optimized_aig.blif`  
- The log prints Rent-aware parameters used and final size/depth of optimized network.  
