----

**Page:** [[Homepage]]/[[Embedded Engineering]]/[[Introduction to Embedded Systems]]

---

## Contents
- [[#What is System?]]
-  [[#What Are Embedded Systems?]]
- [[#Where did it all start?]]
-  [[#Basic Structure of an Embedded System]]
-  [[#Inside of the Embedded System]]
	- [[#Processors]]
	- [[#Memory]]
		- [[#RAM]]
		- [[#ROM]]
		- [[#Hybrids]]
	- [[#Peripherals]]
	- [[#Software]]
	- [[#Algorithms]]
- [[#Future of the Embedded Systems]]
-  [[#References]]
---

## What is System?

System is an understanding of where the components work. It is organizing, working on one or more tasks including a permanent graph.

## What Are Embedded Systems?

We are seeing many examples of embedded systems without even noticing in our daily lives. Even the tools that we need for using computers such as mouses, keyboards, and monitors have microprocessors in them. Cars that we use in our daily life have lots of embedded systems for instance ABS, airbag control unit, environment control unit, injection inspection, radio, CD player, conditioners etc. But what exactly is an embedded system?

An Embedded system is a microprocessor-based system which is designed to control a range of functions and not be programmed by the end user as a PC. By not being programmed by the end user means that its functions can’t be changed by adding/replacing software. But that doesn’t mean functionality can’t be selected by the user. There can be more than one function in an embedded system which can later be chosen by the user. This is what limits the embedded systems but also gives power to them. So what makes them so special that it has many uses in the industry?

## Where did it all start?

A computer has capability to change between different usages, one minute it is a word processor and the next it is a gaming machine. With that it comes with a price. For example, using computers only for solving math problems was an expensive way of wasting your money before calculators were invented. The microprocessors were invented in the 1970s by accident as a replacement for calculator chips. The microprocessors were developed to replace a mass of logic that is in the electronic calculators in the early 1970s. Early calculators were made from discrete logic chips which need more than hundreds to only have a simple four function calculator. As the microprocessors developed, complete calculators were integrated onto a single chip. This opened the chance to develop a very low cost chip compared to original machines that did the same. The answer to build such a chip was some form of programmable capability within it. Building a chip that takes data in and processes it and sends it out again. By using chips like these instead of creating new functions by analyzing gate level logic and reprogramming it which is a very long process they could change the program code in the processor to create new products. And microprocessors were born.

## Basic Structure of an Embedded System

An embedded systems basic structure has five components. The components are followed as:

- **Sensor:** The sensor measures the physical amounts to an electrical value which can be readed by an embedded systems engineer. A sensor stores the measured amount into the memory.
- **A-D Convertor:** An analog-to-digital converter converts the analog signal sent by the sensor into a digital signal.
- **D-A Convertor:** A digital-to-analog converter converts digital data input from a computer into analog data.
- **Processor & ASICs:** Processors compute data as output and store it in memory. ASIC (Application Specific Integrated Circuit) is specified for a particular use rather than general-purpose processors.
- **Actuator:** The actuator evaluates the output of the D/A converter as the stored final output and stores the standard output.

## Inside of the Embedded System

#### Processors

The main criteria for a processor are: does it provide computing power required to perform tasks within the system? This may seem obvious, but what often happens is that tasks are underestimated in terms of size and/or complexity. 

In many cases these kind of problems occurs because final system may not meet the requirements but in the virtual environments products work as intended or interrupts may be higher than expected and these all can cause issues that can turn the paper design into the failed reality.

Even though performance is essential with a processor and must be first considered, there are other matters also important such as system cost, power consumption, software tools and component availability. When all of them are above the standards a processor is good enough to stay on the market.

#### Memory

Memory is an important part in any embedded system design and affected by the software design and how it is developed. Memory primarily performs two functions within the system:

- Provides storage for the software that will run
- Provides data for program variables and intermediate results, status informations and other data that might be created while the program is working

Memory has different version which supports different features:

##### **RAM**

RAMs have two different types: static RAM (SRAM) and dynamic RAM (DRAM). The difference between them is the lifetime of the data they store. SRAM stores its data as long as the chip is powered. If the power is turned off even for a second, its contents will be lost forever. DRAM however has an extremely short data life which is about four milliseconds even though the power is applied constantly.

DRAM may look useless by itself but a simple piece of hardware called DRAM controller makes it behave like SRAM. The job of the DRAM controller is refreshing the data in the DRAM before it is lost. So DRAM can be useful as well as a SRAM. Then why are we using both?

When deciding which type of RAM to use, designers focus on access time and cost. Even though SRAM offers extremely fast access times it is much more expensive to produce. Generally SRAM is used only when the access speed is indispensable. Lower cost makes DRAM attractive when large amounts of RAM is required. Many embedded systems make use of both types: SRAM for critical data paths and DRAM for basically everything else.

##### **ROM**

ROMs are classified by the methods that are used to write new data into them. First ROMs were hardwired devices that contained preprogrammed functions or sets of data. Contents were specified before chip production so data could be used to arrange the transistors inside the chip. Hardwired memories are even used nowadays and they are called “masked ROMs”. Primary advantages of masked ROMs are low cost. But the cost is low if it is mass produced.

The next is PROM (programmable ROM) which is in an unprogrammed state. If you were to look at the contents of a PROM when you buy it you could only see 1’s. With the device programmer -a special equipment to write data into PROM- it can be programmed and its contents can’t be changed afterwards. If the code must be changed then the device must be discarded. Because of this they are also known as one-time programmable (OTP) devices.

EPROM (erasable and programmable ROM) is programmed exactly the same way as a PROM. But they can be erased and reprogrammed by exposing them to a strong ultraviolet light. By doing this they can be returned into an unprogrammed state which makes them essential for the development and testing process.

##### **Hybrids**

As the technology advanced, a way between RAM and ROM was found. Nowadays several types of memory combine both of the features. These devices don't belong to any of the groups so they are classified as hybrids. Hybrid memories can be read and written as desired like RAM and maintain their contents without power as ROM. EEPROM and flash are first examples of hybrid devices. They are used to store code. NVRAM however is a modified version of SRAM so it usually holds persistent data.

EEPROM (electrically erasable and programmable ROM) are similar to EPROMs but the erasing option is electrically. Any byte of data within EEPROM can be erased and rewritten. Primary tradeoff for its function is its high cost but write cycles are longer than RAM. So it is not best to use as main system memory.

Flash memory combines the devices described so far. They are high density, low cost, fast (to read but not to write), volatile and electrically reprogrammable. Advantages are so overwhelming that use of them in embedded systems has increased dramatically over the years.

Third member NVRAM (non-volatile RAM) has the characteristics of ROM and hybrid memories discussed previously. However NVRAM is very different physically. NVRAM is actually just an SRAM with battery backup. When its power is turned on it operates like SRAM. But when it is turned off it retains its data. It is commonly used in embedded systems but as everything comes with its own price NVRAM is expensive, even more expensive than SRAM because of its battery so it is generally limited to storage of few hundred bytes of critical data that can’t be stored another way.

#### Peripherals

Embedded systems have to be in communication with the outside world. That is done by peripherals. They are usually associated with sensors to control output operations done by the system.

Embedded systems can be modeled with a three stage pipeline, firstly data and information input, secondly processing the data comes and thirdly generating output data. Peripherals are used to effectively generate the output data in this model.  Main types of peripherals are used include:

- Binary outputs

Simple external pins whose logic state can be changed by the processor to be logic zero or logic one.

- Serial outputs

Interfaces that send data in serial mod with one or two pins.

- Analogue values

Processors operate in the digital domain while the natural world tends to orientate to analogue values, as a result interfaces between system and external environment get converted between analogue and digital.

- Displays

Displays are really important for showing outputs and getting the connection between product and user together. They can vary from simple LEDs to LCD panels.

- Time derived outputs

Timers and counters are one of the most common functions used within an embedded system.

#### Software

Software components are the things that add value to the system and define what it does  The software consists several components:

- Initialization and configuration
- Operating system or run-time environment
- The applications software
- Error handling
- Debug tools
#### Algorithms

Algorithms are the key to constituents of the software. They can vary from mathematical processes to models of the external environment. Selecting algorithms might look easy but it is much harder than it looks because embedded systems are designed to be commercially successful. Choosing the right algorithm is important, for example, it may allow the same function to be executed on cheaper hardware.

## Future of the Embedded Systems

The Internet of Things (IoT) gets popular day by day. IoT describes embedded systems that are built in physical objects or objects groups which can communicate via the internet or other networks to exchange data with other devices and systems. This era started and continues to evolve because of new technologies such as ubiquitous computing, new sensors, powerful new chips, machine learning and A.I.

IoT generally is synonymous with products in the concept of the smart home. It is used for controlling ecosystems via devices and appliances (such as lights, thermostats, security systems, cameras and many other appliances). IoT is also used in healthcare systems.

IoT’s popularity and the people’s desire for automation make embedded systems popularity rise up. The embedded system market is anticipated to reach around USD 116.2 billion by 2026.

### **References**
1. Embedded Systems Design by Steve Heath
1. <https://learning.shine.com/talenteconomy/career-help/embedded-systems/>
1. <https://www.lojikprob.com/embedded/gomulu-sistemler-nedir/>
1. *ASIC Design in the Silicon Sandbox: A Complete Guide to Building Mixed-signal Integrated Circuits by Keith Barr*
1. [*https://www.heavy.ai/technical-glossary/embedded-systems*](https://www.heavy.ai/technical-glossary/embedded-systems)
1. [*https://www.researchgate.net/publication/323826203_Derivation_of_Symbolic-based _Embedded_Feedback_Control_Stabilization_Expressions_with_Experimentation*](https://www.researchgate.net/publication/323826203_Derivation_of_Symbolic-based_Embedded_Feedback_Control_Stabilization_Expressions_with_Experimentation)
1. [*https://barrgroup.com/embedded-systems/how-to/memory-types-ram-rom-flash*](https://barrgroup.com/embedded-systems/how-to/memory-types-ram-rom-flash)
1. [*https://github.com/nhivp/Awesome-Embedded*](https://github.com/nhivp/Awesome-Embedded)
1. [*https://spectrum.ieee.org/the-surprising-story-of-the-first-microprocessors*](https://spectrum.ieee.org/the-surprising-story-of-the-first-microprocessors)
