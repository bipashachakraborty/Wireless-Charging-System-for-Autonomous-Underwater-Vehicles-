# Wireless-Charging-System-for-Autonomous-Underwater-Vehicles-
Simulation of a wireless power transfer (WPT) system for Autonomous Underwater Vehicles using a full-bridge LLC resonant converter with CC–CV battery charging strategy . Build in Matlab

**Overview**

This project presents a simulation-based design of a **Wireless Power Transfer (WPT)** system for **Autonomous Underwater Vehicles (AUVs)**. The system uses resonant inductive coupling with a full-bridge LLC resonant converter on the transmitter side and a DC-DC buck converter on the receiver side, integrated with a **Constant Current – Constant Voltage (CC–CV)** battery charging strategy.

The work was carried out entirely in **MATLAB/Simulink** and validated through simulation.

---

## Block Diagram

```
**DC Source → Inverter → LLC Filter → [Mutual Inductance / Seawater] → Rectifier → LC Filter → Battery Pack
                                                                          ↑
                                                               Control & Management System (CC–CV)**
```

---

## System Architecture

| Stage | Component | Description |
|---|---|---|
| Transmitter | Full-Bridge LLC Resonant Converter | Converts DC to high-frequency AC for wireless coupling |
| Coupling | Inductive Coils (air/water medium) | Energy transfer via resonant magnetic induction |
| Receiver | Full-Bridge Rectifier + Buck Converter | Rectifies and regulates output voltage |
| Control | CC–CV Switching Logic (PID-based) | Manages battery charging in two phases |

---

**Key Specifications**

| Parameter | Value |
|---|---|
| Rated Output Power | 200 W |
| Output Voltage | 48 V |
| Resonant / Switching Frequency | 100 kHz |
| Resonant Inductance (Lᵣ) | 72 µH |
| Magnetizing Inductance (Lₘ) | 360 µH |
| Resonant Capacitance (Cᵣ) | 72 nF |
| Design Ratio K = Lₘ/Lᵣ | 5 |
| Max Input Voltage | 170 V |
| Min Input Voltage | 141 V |
| CC–CV Transition SOC | 80% |

---

**CC–CV Charging Strategy**

- **Constant Current (CC) Mode:** Battery charges at a fixed current until SOC reaches ~80%, allowing voltage to rise gradually.
- **Constant Voltage (CV) Mode:** Voltage is held at the preset limit; current tapers off until the battery reaches 100% SOC.
- Transition is managed by the buck converter's PID-controlled feedback loop, adjusting duty cycle dynamically.

---

**Voltage Gain Model**

The LLC converter voltage gain is modelled as:

$$M(\omega_n) = \frac{1}{\sqrt{\left[\frac{1}{K}\left(1 + K - \frac{1}{\omega_n^2}\right)\right]^2 + \left[Q\left(\omega_n - \frac{1}{\omega_n}\right)\right]^2}}$$

Where:
- $\omega_n = \omega_s / \omega_r$ — normalized switching frequency
- $Q$ — quality factor
- $K = L_m / L_r$ — inductance ratio

The MATLAB script [`VoltageGainCode.m`](VoltageGainCode.m) plots gain curves for Q = 0.2 to 0.6 with reference lines at M = 0.911 and M = 1.09 (the design operating window).

---

**Simulation Results**

| Output | Observed Value |
|---|---|
| Output Voltage (CC mode) | ~40.35 V |
| Output Voltage (CV mode, after t=40s) | ~40.22 V (stable) |
| Output Current (CC mode) | ~9.40 A |
| Output Current (CV mode) | ~8.33 A (tapering) |
| SOC at CC→CV transition | 80% at t = 40 s |

Smooth CC–CV transition and stable voltage regulation were validated. Switching waveforms confirmed ZVS operation.

---

## How to Run

### Voltage Gain Plot (MATLAB / GNU Octave)
```matlab
% Open MATLAB or Octave, navigate to the matlab/ folder, then:
run('VoltageGainCode.m')
```

### Simulink Simulation
1. Open MATLAB (R2021a or later recommended).
2. Navigate to `simulink/`.
3. Open `FinalModel.slx`.
4. Click **Run** (Ctrl+T).
5. View scopes for voltage, current, and SOC outputs.

> **Note:** Simscape and Simulink toolboxes are required. For CC–CV testing in isolation, open `SwitchingCCCVTesting.slx`.

---

Topology Comparison

| Feature | LLC | DAB | CLLC |
|---|---|---|---|
| Efficiency | 96–98% | 90–95% | 96–98% |
| ZVS Capability | Excellent | Good | Excellent |
| Power Density | High | Medium-High | High |
| Control Complexity | Moderate | High | High |
| Operating Frequency | 100–500 kHz | 20–200 kHz | 100–200 kHz |
| Best Suited For | EVs, Batteries, Robotics | EVs, Batteries | Wireless Charging |

LLC was selected for its balance of high efficiency, moderate control complexity, and suitability for wide load ranges.

---

Limitations

- Simulation-only; no hardware prototype built.
- Environmental factors (seawater conductivity, pressure, temperature) were not modelled.
- Coil misalignment effects were not simulated.
- Battery aging and degradation were not accounted for.

---

References

1. Taiwan Ocean University (2012). *Wireless Power Transfer Based on LLC Converter.* ECCE Asia.
2. Politecnico di Torino (2014). *Design of an LLC Resonant Converter.* Master's Thesis.
3. Bobba et al. (2022). *Design and Development of WPT System for AUV Applications.* IEEE Xplore.
4. Manikandan et al. (2015). *Contactless Battery Charger for Underwater Vehicles.* Academia.edu.
5. Menon et al. (2013). *Wireless Power Transfer to Underground Sensors Using Resonant Magnetic Induction.* WOCN.
6. Gopika & Jayasree (2023). *Inductive Wireless Charging Solution for Underwater Vehicles.* ICEPE.

---

## License

This project is submitted in partial fulfillment of the B.Tech degree requirements at **NIT Agartala**. All rights reserved by the authors.

© 2025 Tanmay Das · © 2025 Soumyadeep Rakshit
