# Technical Report: SAW Filter Design Optimization for Wireless Applications
**(Based on MATLAB Modeling and Experimental Validation)**

Link to original paper: https://dl.acm.org/doi/10.5555/1376148.1376152
## 1. Executive Summary
This report details the design and analysis of Surface Acoustic Wave (SAW) filters for wireless communication systems. Key outcomes include:
- Development of a MATLAB model for SAW filter response prediction
- Parametric analysis of Interdigital Transducer (IDT) geometry
- Performance metrics: Bandwidth (BW), Quality Factor (Q), and Insertion Loss (IL)

## 2. Theoretical Framework

### 2.1 SAW Filter Physics
The model integrates:

- **IDT Transfer Function**

  ![image](https://github.com/user-attachments/assets/ec2c7331-69d6-407d-8ef8-5d6f347d40b7)

- **Propagation Effects**

  ![image](https://github.com/user-attachments/assets/20cf5afe-fa4d-4e00-b27c-dc06d154ce3a)

  
### 2.2 Key Design Parameters

| **Parameter**    | **Symbol** | **Value (Mobile Transceiver Case)** |
|-----------------|------------|--------------------------------------|
| Center Frequency | `f0`       | 902 MHz                             |
| Input IDT Pairs | `N_in`      | 30                                  |
| Output IDT Pairs | `N_out`    | 6                                   |
| SAW Velocity    | `v_SAW`     | 3480 m/s (ZnO/SiO2/Si)              |
| IDT Separation  | `d_c`       | 100 µm                              |

## 3. MATLAB Model Implementation

### 3.1 Code Features
#### Core Functions:
- Bandwidth calculation using linear interpolation
- Log-scale power normalization

#### Substrate Properties:
- ZnO/SiO2/Si parameters

| **Formula** | **Description** |
|------------|----------------|
| `Ga0 = 8 * k^2 * f0 * C0 * W * N` | Radiation conductance |
| `C0 = 2 * (6.5 * η² + 1.08 * η + 2.37) * (ε_r + 1)` | Capacitance |

### 3.2 Performance Metrics

| **Parameter** | **Value** |
|--------------|----------|
| Bandwidth (BW) | `25.1 MHz` (3-dB threshold) |
| Quality Factor (Q) | `f0 / BW = 35.9` |
| Insertion Loss (IL) | `-2.15 dB` |

## 4. Results & Analysis

### 4.1 Frequency Response
![SAW_Response](https://github.com/user-attachments/assets/d5c7cbcd-eda7-4adf-aa12-fae5e17aab00)  

**Figure: Frequency response showing input/output IDT and combined filter characteristics.**

### 4.2 Parametric Sensitivity

| **Parameter Variation** | **Bandwidth Impact** | **Q Factor Impact** | **Design Implication** |
|-------------------------|----------------------|----------------------|------------------------|
| **Input IDT Fingers Increase** (20 → 40 Pairs) | Decrease 30% | Increase 45% | Tradeoff: Narrower Bandwidth But Sharper Frequency Selectivity |
| **IDT Separation Increase** (50 → 150 µm) | No Significant Change | Stable | Enables Flexible MEMS Layout Without Performance Degradation |

## 5. Validation Against Experimental Data

| **Metric** | **MATLAB Model** | **Experimental Data** | **Error** |
|-----------|---------------|------------------|--------|
| BW (MHz) | `25.1` | `25.0` | `0.4%` |
| Peak Frequency (MHz) | `902.0` | `902.0` | `0.0%` |

## 6. Practical Recommendations

| **Item** | **Details** |
|---------|-----------|
| IDT Optimization | Use `N_out << N_in` to avoid bandwidth narrowing |
| Substrate Choice | ZnO/SiO2/Si for `v_SAW > 3000 m/s` |
| MEMS Fabrication | Maintain `d_c ≤ 100 µm` for compact designs |

## 7. Conclusion
The MATLAB model achieves **<1% error in bandwidth prediction** and provides a robust framework for SAW filter design.

## Appendix

### A1. Parameter Tables

| **Substrate** | **SAW Velocity (m/s)** | **Relative Permittivity (ε_r)** |
|-------------|------------------|------------------------|
| ZnO/SiO2/Si | `3480` | `8.5` |
| LiNbO3 | `3960` | `28` |

### A2. Figure Placement Guide
1. **Figure 1**: Frequency response plot (log scale, combined response)
2. **Figure 2**: Parametric sensitivity bar charts (BW vs. `N_in/d_c`)


[Get the code](MATLAB/SAW_MATLAB/Project1/code.m)
