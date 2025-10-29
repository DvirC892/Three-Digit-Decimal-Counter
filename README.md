# 🔢 Three-Digit Decimal Counter – Basys 3 FPGA Project

### Developed by: Dvir Cohen  
### Board: Digilent Basys 3 (Artix-7 XC7A35T-1CPG236C)

---

## 🧠 Project Overview
This project implements a **three-digit decimal counter** on the **Basys 3 FPGA** using **VHDL**.  
The counter increments its value in real time and displays the output across three **7-segment displays**.  
The **maximum count value** is selected dynamically via the on-board **switches (`SW[3:0]`)**, allowing the user to define the limit before the counter resets.

---

## ⚙️ Features
- 3-digit decimal counting display (000–999)
- **User-selectable maximum value** via switches
- **Real-time counting** synchronized with the on-board 100 MHz clock
- Automatic reset when the count reaches the chosen maximum
- Fully implemented in **VHDL**
- Designed and synthesized for **Basys 3 FPGA**

---

## 🧩 Hardware Connections

| Component | Pins | Description |
|------------|------|-------------|
| Switches | `SW[3:0]` | Select maximum count value |
| 7-Segment Display | `SEG[6:0]`, `AN[2:0]` | Displays the decimal counter |
| Clock | `W5` | 100 MHz on-board oscillator |
| LEDs | Optional | Can mirror current digit or status |

---

## 🧱 System Architecture
<p align="center">
  <img src="https://github.com/DvirC892/projectPhotos/blob/main/Three%20Digit%20Decimal%20Counter.png" 
       alt="Three Digit Decimal Counter Architecture" width="750">
</p>

### Description
- **Clock Divider:** Converts the 100 MHz FPGA clock into a human-visible counting frequency.  
- **Counter Module:** Increments the count up to the selected limit.  
- **Comparator:** Checks if the current count equals the user-defined maximum.  
- **7-Segment Encoder:** Converts each digit (0–9) to the correct 7-segment pattern.  
- **Multiplexer:** Cycles between the three active displays (`AN[0–2]`) at high frequency for visual persistence.

---

## ▶️ How It Works
1. Set a **maximum value** using the onboard switches (`SW[3:0]`).  
2. The counter starts incrementing from `000`.  
3. When the value equals the selected maximum, it resets back to `000`.  
4. The result is continuously shown across three **7-segment displays** in real time.

---

## 🧮 Example Behavior

| Switch Value | Max Count | Display Sequence |
|---------------|------------|------------------|
| `0001` | 001 | 000 → 001 → 000 |
| `0101` | 005 | 000 → 001 → … → 005 → 000 |
| `1010` | 010 | 000 → … → 010 → 000 |
| `1111` | 015 | 000 → … → 015 → 000 |

---

## 💻 File Structure

| File | Description |
|------|--------------|
| `three_digit_counter.vhd` | Main counter logic |
| `seven_seg_decoder.vhd` | 7-segment encoder |
| `mux_3digit.vhd` | Display multiplexer |
| `clock_divider.vhd` | Generates slower clock for display refresh |
| `top_module.vhd` | Top-level integration |
| `tb_three_digit_counter.vhd` | Testbench |
| `basys3_constraints.xdc` | Board pin constraints |
| `README.md` | Project documentation |

---

## 🧰 Tools Used
- **Vivado Design Suite 2023.1**
- **VHDL-2008**
- **Basys 3 FPGA (Artix-7 XC7A35T)**
- **Simulation:** Vivado Behavioral Simulation

---

## 📸 Example Outputs
| Switch Setting | Display Output | Description |
|----------------|----------------|-------------|
| `0001` | `001` | Counter loops every 1 count |
| `0110` | `006` | Counter loops every 6 counts |
| `1111` | `015` | Counter loops every 15 counts |

---

## 🧾 License
This project is open-source and free for educational use.  
If you use or modify it, please credit **Dvir Cohen**.

---

## 💬 Contact
📧 [LinkedIn – Dvir Cohen](https://www.linkedin.com/in/dvir-cohen892)  
📁 GitHub: [DvirC892](https://github.com/DvirC892)
