# 16x1_mux_gate_level

This repository contains Verilog implementations of multiplexers (MUX) at different levels of hierarchy:
- **2x1 MUX** (gate-level modeling)
- **4x1 MUX** (built using 2x1 MUX)
- **16x1 MUX** (built using 4x1 MUX)

It also includes testbenches and circuit diagrams for better understanding.

---

## 📂 Project Structure
```

mux2to1.v       → 2x1 MUX implementation
mux4to1.v       → 4x1 MUX (hierarchical using 2x1 MUX)
mux16to1.v      → 16x1 MUX (hierarchical using 4x1 MUX)
mux16to1_tb.v   → Testbench for 16x1 MUX
4x1 MUX using 2x1 MUX ckt diagram.png
16x1 MUX using 4x1 MUX ckt diagram.png
Note            → Begginer mistakes 

````

---

## 📝 Description
- **2x1 MUX** is implemented at gate-level using basic logic gates.  
- **4x1 MUX** is constructed using 2x1 MUX modules.  
- **16x1 MUX** is constructed hierarchically using 4x1 MUX modules.  

Each design has been tested with a corresponding **testbench** to verify correct functionality.

---
## 📊 Truth Tables

### 🔹 2x1 Multiplexer
| **S** | **I0** | **I1** | **Y** |
|-------|--------|--------|-------|
| 0     | D0     | D1     | D0    |
| 1     | D0     | D1     | D1    |

---

### 🔹 4x1 Multiplexer
| **S1** | **S0** | **I0** | **I1** | **I2** | **I3** | **Y** |
|--------|--------|--------|--------|--------|--------|-------|
| 0      | 0      | D0     | D1     | D2     | D3     | D0    |
| 0      | 1      | D0     | D1     | D2     | D3     | D1    |
| 1      | 0      | D0     | D1     | D2     | D3     | D2    |
| 1      | 1      | D0     | D1     | D2     | D3     | D3    |

---

### 🔹 16x1 Multiplexer
| **S3** | **S2** | **S1** | **S0** | **Selected Input** | **Y** |
|--------|--------|--------|--------|---------------------|-------|
| 0      | 0      | 0      | 0      | D0                  | D0    |
| 0      | 0      | 0      | 1      | D1                  | D1    |
| 0      | 0      | 1      | 0      | D2                  | D2    |
| 0      | 0      | 1      | 1      | D3                  | D3    |
| ...    | ...    | ...    | ...    | ...                 | ...   |
| 1      | 1      | 1      | 1      | D15                 | D15   |

*(Full table is 16 rows, shown partially for brevity.)*

---


----
## ▶️ Simulation
To run the simulation (using `iverilog` + `gtkwave`):

```sh
iverilog -o mux16to1_tb mux2to1.v mux4to1.v mux16to1.v mux16to1_tb.v
vvp mux16to1_tb
gtkwave mux16to1.vcd
````

---

## ✨ Key Notes

* **Don’t confuse `reg` and `wire`:**

  * Use `wire` for connections between modules.
  * Use `reg` inside `always` blocks for sequential/combinational logic.
* Hierarchical design makes large multiplexers easier to implement and test.

---

## 📌 Author

Designed & implemented as part of Verilog practice 🚀

```

