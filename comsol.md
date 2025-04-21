# COMSOL Tutorials

## Capillary Simulation in COMSOL

**Overview:**  
Imagine designing a terry towel or bandage—materials that need maximum fluid absorption. The absorption process is governed by capillary action, which depends on fiber geometry and the liquid-gas contact angle. This tutorial dives into how Multiphysics simulation can optimize such designs.

**Content:**  
1. **Introduction to Capillary Action**: Learn how fiber geometry and contact angles influence liquid absorption.  
2. **Simulation Approach**:  
   - Simulate capillary rise profiles for varying angles (30°, 45°, 68°).  
   - Validate results with theoretical studies, achieving 98% accuracy.


## Watch the Video
<iframe src="https://1drv.ms/v/c/3c0756bed86bd4d2/IQTXTe5yOVJaS52Ju0YPpBEmAar3bGykQiV628pQHzKEejk" width="1000" height="800" frameborder="0" scrolling="no" allowfullscreen></iframe>


**Key Findings:**  
- Lower contact angles result in higher capillary rise.  
- Optimization focuses on fiber material and diameter for maximum fluid absorption.

**Pro Tips for COMSOL Simulation:**  
1. Adjust phase field parameters for better approximations.  
2. Define fluid properties correctly (fluid 1: gas, fluid 2: liquid).  
3. Use "suppress backflow" and hydrostatic pressure compensation as needed.

## Unit Cell IDT SAW sensor Modeling using COMSOL Multiphysics
# **IMPORTANT COMSOL MEMS SIMULATION TRICKS!**

I am going to share some important and uncommon tricks that you rarely find elsewhere on the internet for MEMS simulation in COMSOL Multiphysics.

## **Challenges in Evaluating Electrical Response**
If you are a COMSOL user, you may have noticed that evaluating electrical response at the output terminal can be tricky. Defining output terminals for measurement in COMSOL physics is often cumbersome. While **probes** can be defined, probing and measuring the output response from the terminal is fundamentally different.

Defining terminals allows structured studies, such as **system control system design**, but assigning initial values and sources defeats the purpose of output signal analysis. To overcome this issue, I devised a simple and elegant trick.
![image](https://github.com/user-attachments/assets/aa73411e-ae5d-45e6-a416-8613d19e040b)

![image](https://github.com/user-attachments/assets/065ef09b-011f-4337-8fab-5d710b72e55b)

## **Solution: Using an Electric Circuit Module**
The answer lies in **basic electric circuit principles**. We simply need to add a **voltage meter** across the output ports in the COMSOL model. Though integrating a multimeter into COMSOL geometry may sound complex, the implementation is straightforward with the **COMSOL Electric Circuit Module**.

However, I must note that the **circuit module interface** could be improved—currently, it lacks a graphical representation of where electrical elements (resistors, capacitors, sources, etc.) are placed. You must visualize the connections mentally or sketch a **schematic** in your notebook.

## **Important Notes on Using the Electric Circuit Module**
1. **Ground is usually node 0.** When connecting electrical elements, you directly connect them to nodes—**no need to worry about wiring.**
2. **External terminals** must be defined in the electric circuit module. These terminals enable **communication between different physics** you have implemented.

## **Analyzing SAW Reflection on Boundaries**
I am currently studying the effects of **SAW reflection on the boundaries**. With the **Electric Circuit Module** integrated, I was able to **perform an in-depth analysis** of my **SAW delay line model**.

![image](https://github.com/user-attachments/assets/ddb2e983-d1c4-4946-b64f-5d35efe02bfa)



For this study:
- There is **no perfectly matched layer (PML) setup** on the device's **sides**, unlike at the **bottom** (see geometry below).
- Consequently, **reflection effects are pronounced** in the results (**see voltage profile, stress, and displacement values over different time points**).

## **Need Help?**
If you have questions about **combining the Electric Circuit Module into a Multiphysics model**, or if you're interested in understanding **SAW reflection effects on device boundaries**, feel free to **reach out**. I’ll be happy to help!


## COMSOL Multiphysics simulation of Capillary Rise on a tube

# **Capillary Rise in COMSOL Multiphysics**

Capillary rise is a **spontaneous action** in which a liquid rises in a narrow tube due to fluid surface tension and the combination of **cohesive forces** of the liquid and **adhesive forces** between the liquid and tube material.

## **COMSOL Multiphysics Simulation**
I have conducted a **COMSOL Multiphysics simulation** to model the natural capillary rise action of water in a thin tube. COMSOL Support also provides a helpful tutorial on capillary filling, which you can find here:  
🔗 [Capillary Filling Tutorial](https://lnkd.in/gMHAf59E)

### **Important Considerations for Capillary Rise Simulations**
When simulating capillary rise, it is crucial to select appropriate **boundary conditions**, including:
- **Wetted wall conditions**
- **Fluid inlet/outlet definitions**
- **Contact angle selection**

![Capillary ppt for linkedIn](https://github.com/user-attachments/assets/6590fa78-72ce-478a-9ebb-40cfd6250a54)


Proper implementation of these parameters ensures **accurate modeling of capillary phenomena**.

## **Need Help?**
If you have any **questions** or **issues** simulating capillary rise or two-phase flow systems, feel free to **connect with me**! I’m happy to assist.

# **Surface Acoustic Wave (SAW) Sensors in MEMS Applications**

SAW (Surface Acoustic Wave) sensors are among the most popular **Microelectromechanical Systems (MEMS)**, widely used in:
- **Automotive systems**
- **Gadgets and consumer electronics**
- **Bioinstrumentation**
- **Industrial instrumentation systems**

## **COMSOL Multiphysics Simulation of SAW Sensors**
Below is an example of a **SAW sensor simulation** conducted using **COMSOL Multiphysics**.

### **Study Process**
1. **Finding suitable eigenmodes** for the system.
2. **AC excitation of the IDT (Interdigitated Electrode)** at a selected frequency.

The animation below illustrates how the **surface of piezoelectric material (LiNbO₃)** undergoes **periodic deformation** to generate a **surface wave (SAW).**

![ppt gif](https://github.com/user-attachments/assets/85d90eb9-54ed-4b78-8f32-b9169edf0ea8)

## **Working Principle**
- The generated **SAW propagates** through the **test substrate**.
- The **wave properties alter** as it passes, and these variations are detected at the receiving end.
- This detection enables **characterization of the test substrate**.

### **Enhancing the Sensor System**
To make the sensing system **more robust and accurate**, redundant elements such as **reflectors** can be introduced at **both ends of the IDT section**. Additionally, **signal acquisition and processing** are required for full sensor functionality.

## **Co-simulation with MATLAB/Simulink**
For an even more advanced simulation, **MATLAB/Simulink** can be integrated to model the **entire SAW sensor system**.

Stay tuned! I will be sharing a **co-simulation** study in an upcoming post.

## **Need Help?**
If you have any **questions** regarding:
- SAW sensor modeling
- Piezoelectric system simulations
- MEMS applications in COMSOL

Feel free to **reach out**! I’d be happy to **share, learn, and grow together**.

##SAW Delay line design using COMSOL Multiphysics step-by-step pictorically

![image](https://github.com/user-attachments/assets/fcbe0967-695c-4e8c-ac90-f797284b4f0d)
Reference: https://www.researchgate.net/publication/329908918_Modelling_and_simulation_of_SAW_delay_line_sensors_with_COMSOL_Multiphysics

Step 1: Setting Up the Model
Begin by creating a new model in COMSOL and selecting the appropriate physics interfaces for acoustics and piezoelectric devices. Define the geometry of your SAW device, including the substrate material, the reflectors, and the Interdigital Transducers (IDTs). 


128o YZ-LiNbO3 Piezoelectric material
![image](https://github.com/user-attachments/assets/2b91d1b8-4b6c-4799-ba87-b670788ca452)

![image](https://github.com/user-attachments/assets/220dfc22-6913-4404-b7d6-ada65409b335)

![image](https://github.com/user-attachments/assets/a22a9dbb-1ab6-419f-aeeb-8f959cd8522d)

![image](https://github.com/user-attachments/assets/238a34df-c61f-4f40-9afe-d8a51f6f72ab)

![image](https://github.com/user-attachments/assets/d6550a1c-7b67-4daf-a1cb-d4f9bf13fdc3)

![image](https://github.com/user-attachments/assets/f1102de6-5909-401a-bd81-883449923771)

Next step is to analyze S parameters and Admittance to select working central frequency. 
