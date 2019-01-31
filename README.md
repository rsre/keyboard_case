# Design exploration to make a case for ALPS I2KC273A


Some time ago a friend gave me this barebones keyboard with Alps switches. They seem to be Alps SKCC Cream. It has some very nice old school spheric keycaps. The keyboard consists of a steel plane where the switches are mounted and a PCB that connects them. I decided to create a case for it so I can use it.

All the designs are made using [OpenSCAD](http://openscad.org).

## Iterations

First I modelled the keyboard so I could design around it.


<img src="/keyboard_raw.png" width=350/>


On my first try I began by designing a case loosely based on the IBM Pingmaster and the IBM Model M. I didn't like how bulky it was coming out and the lack of design features didn't allow to make it feel slimer so I abandoned the first design.


<img src="/V1/pingmaster.png" width=350 />


The second iteration was also based on a classic: the kishaver. This time I decided to try another approach to OpenSCAD design. The idea was to design the outer shell first and then hollow it accordingly. However, once I had the outside done I didn't really like the way it looked. Kishaver looks cool when your keyboard layout fills the whole well, a nice, squared layout. With my layout it looked too spare.


<img src="/V2/kishaver.png" width=350 />


Looking for some inspiration I came across a Cherry G80-3000 inspired GH60 case. I quite liked the design so I setted to try to imitate it. I liked that it looked kind of retro but also that it had some design elements that could help me make the complete thing more sleek and slim. I designed the outer case with a few custom modifications like the top bar over the keys, I love having a place to rest my pen there. I proceded to hollow it out and then added a lip between the two parts and screw holes so it can be fastened together. I also added a place to add a USB port like [this](https://es.aliexpress.com/item/2017-New-Arrival-Black-Printer-Panel-Mount-Cable-Screw-Mini-USB-5-Pin-Male-to-USB/32831695483.html) and some branding. I don't have the proper measures for the USB port and I don't know if I'll even be able to fit it in the final design without some modding, We'll see.


<img src="/V3/g60_or_something.png" width=350 />


I have decided to print this diagonally and vertical in the sort axis in my printer because I can only print 300x200mm. I still have to do do some test prints at scale, check if everything fits, correct mistakes, etc.


## Electronics and firmware

In testing I was using an arduino UNO with some code I found online. In the "final" version I'll probably use the TMK or QMK firmware with an arduino nano or something along the lines.