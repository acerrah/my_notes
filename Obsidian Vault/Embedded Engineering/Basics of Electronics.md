""----

**Page:** [[Homepage]]/[[Introduction to Embedded Systems]]/[[Basics of Electronics]]

---

## AC and DC

AC stands for alternative current and DC stands for Direct current. If you are reading this on your computer probably your computer plugged into a wall outlet which gives AC. For another example, batteries gives DC. But wait a second, you plug your  battery with a wall outlet, right? But one of them is AC and but one of them is DC, you may ask how. Because AC and DC can be converted between them with some electronic devices. Now we understand what AC and DC used for let's explain the difference between them.

While AC is travelling through a wire it alternates which direction it is travelling. It will happen many times in seconds. DC however travels in one way.

## Closed/Open Circuits

![[opencircuit.svg]]
This is a example of a open circuit because it is not finished and lamb will not light.

![[closecircuit.svg]]
But in this example the bulb would light up because the electric goes from one end to other which is a close circuit.

## Flow and Resistance

Electricity is basically flow of electrons and voltage which is measured with volts (V) is the pressure of electricity. That means voltage is the scale of how many electrons i can push out from the battery. Current is the flow rate of electricty. It is measured with Amperes (I). You may think how do we change the flow rate and answer to this is resistance. Resistance is which measured by Ohms (r). You may think resistance as big pipe and small pipe that controls the electricity flow. But how de we change it?

## Resistor

Resistors are how we add resistance to our circuits. Let's think a battery that gives lots of electricty and a lamp that can't handle that much electricity. We can simply lower the current by adding a resistor to our circuit.

We knew that resistance is measured with ohm but how do we know which resistor is 10 ohms and which one is 1000 ohms? To learn that we use a simple chart:

![[resistorchart.png]]

Resistors have colorful lines on them and we use chart to decrpyt their resistance. For an example.
![[resistor10ohm.svg]]

In this example we have brown, black, black and red. We will firstly look at 1st and 2nd colors which is brown and black. Then we write their numbers on the chart. Brown is 1 and black is 0. Which gives us 10. Then we multiply it with the 3rd color. Our 3rd color is also black and its multiplier is 1, so 10 times 1 is still 10. Our resistor is 10 ohms. But what is the last color for? The last color represents the tolerance of our resistor. Our last color in the example is red which is a +-%2 tolerance. That means our resistor is actually 10 +-%2 ohms.

## LED

LED stands for Light-Emitting Diode. It seems fancy but they are basically tiny little light bulbs. 

![[led.svg]] 
LED is a diode (we will talk about diodes in the future) that means it must be hooked up in a specific way. LED generally has two legs long one is anode (+),  short one is cathode (-).

## How to calculate resistance?

To calculate how much resistance we need to use our component without any damage, we need some information. We need to know Voltage of our power source, forward Voltage of our component and how many Amps our component uses. 

	Resistance = (Power Source Voltage - Forwarc Voltage of component) / Amps


## Multimeter

A multimeter is a device to measure voltage, resistance and amps. It has a positive and negative test probes.

## Schematics

![[basicsofschematics.svg]]

## Switches

There are many types of switches. Lets start with the SPST switches(single pull single throw). SPST switchew have a single wire input and single wire output. If it is off there is no electricty, if it is on the circuit is closed and it is working.

![[SPST.svg]]

There is SPDT switches(single pull double throw). As the name explains instead of having no electricty at off section, it gives electricty to a different wire.

![[SPDT.svg]]

DPST switches acts as the same thing as SPST but it acts as two seperate connections.

![[DPST.svg]]

I think you can imagine what a DPDT switch is.

![[DPDT.svg]]

