// Created by Matthew Alexander Manuel 2016-03-09
// matt@mattmanuel.com http://www.mattmanuel.com
// The MIT License (MIT)
/* Copyright (c) 2016 Matthew Alexander Manuel

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

use <hexagon-mxm.scad>

$fs = 0.5;
$fa = 3;
slopValue = 0.2; // mm, suggested to be half the nozzle size of your printer
// mount is oriented so "up" is along the y-axis
// baseHeight starts at 0 on y-axis and goes negative
module GoProMount(baseHeight) {
    outsideDiameter = 15; // mm
    insideDiameter = 5.5; // mm
    minimumBaseHeight = 10; // mm
    outsideProngWidth = 2.75 - slopValue; // mm
    insideProngWidth = 3.15 - slopValue; // mm
    quarterTwentyNutRadius = 12.55/2; //mm (for tripod mount)
    
    difference() {
        union() {
            hull() {
                translate([0,-baseHeight/2,0]) cube([15.1,(baseHeight),15], center = true);
                translate([0,minimumBaseHeight/2,0]) cube([15.1, minimumBaseHeight, 15], center = true);
            }
            // leftProng;
            translate([15.1/2-outsideProngWidth/2,minimumBaseHeight,0]) hull() {
                cube([outsideProngWidth,outsideDiameter,15], center = true);
                translate([0,outsideDiameter,0]) rotate([0,90,0]) cylinder(h= 2.75, d = outsideDiameter, center = true);
            }
            // centerProng
            translate([0,minimumBaseHeight,0]) hull() {
                cube([insideProngWidth,outsideDiameter,15], center = true);
                translate([0,outsideDiameter,0]) rotate([0,90,0]) cylinder(h= insideProngWidth, d = outsideDiameter, center = true);
            }
            // rightProng
            translate([-(15.1/2-outsideProngWidth/2),minimumBaseHeight,0]) hull() {
                cube([outsideProngWidth,outsideDiameter,15], center = true);
                translate([0,outsideDiameter,0]) rotate([0,90,0]) cylinder(h= outsideProngWidth, d = outsideDiameter, center = true);
            }
             translate([insideProngWidth/2+1.6,minimumBaseHeight+2.5,0]) {
                difference() {
                    cylinder(15,d = 8,center = true);
                    cylinder(22,d = 4,center = true);
                    translate([0,5,0]) cube([10,10,25],center = true);
                }
            }
            
            translate([-(insideProngWidth/2+1.6),minimumBaseHeight+2.5,0]) {
                difference() {
                    cylinder(15,d = 8,center = true);
                    cylinder(22,d = 4,center = true);
                    translate([0,5,0]) cube([10,10,25],center = true);
                }
            }
    
       }
       translate([0,minimumBaseHeight + outsideDiameter,0]) rotate([0,90,0]) cylinder(h = 30, d = insideDiameter, center = true);
       // hex cutout for 1/4 20-pitch nut for tripod mount
        translate([0,-baseHeight,0]) rotate([90,0,0]) hexagon(quarterTwentyNutRadius + slopValue,2);[ 0.00, 0.00, 0.00 ]
    }
}

color("Green", alpha = 0.7) GoProMount(10);