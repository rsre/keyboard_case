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


Looking for some inspiration I came across a design I quite liked and I setted to try to imitate it. I liked that it looked kind of retro but also that it had some design elements that could help me make the complete thing more sleek and slim. This is the current design phase. I have most of the outer design completed, now I need to hollow it and make holes for screws and connectors.


<img src="/V3/g60_or_something.png" width=350 />


After that's done I'll have to decide how to print this in my printer because I can only print 300x200mm. Then do some test prints, check if everything fits, correct mistakes, etc.


## Electronics and firmware

In testing I was using an arduino UNO with some code I found online. In the "final" version I'll probably use the TMK firmware with an arduino nano or something along the lines.