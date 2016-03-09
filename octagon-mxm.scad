// Created by Matthew Alexander Manuel 2016-03-09
// matt@mattmanuel.com http://www.mattmanuel.com
// The MIT License (MIT)
/* Copyright (c) 2016 Matthew Alexander Manuel

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

// size is the XY plane size, height in Z
module octagon(scaleSize, extrudeHeight) {
    // circumscribed size -- circle radius touching points, not sides
    sin225 = sin(22.5); // pre-calculate to save CPU cycles a bit (probably not necessary, but a good practice)
//    cos30 = cos(30);
    scale([scaleSize,scaleSize,1]) linear_extrude(height = extrudeHeight, center = true) polygon(points = [ [1,sin225],[sin225,1],[-sin225,1],[-1,sin225],[-1,-sin225],[-sin225,-1],[sin225,-1],[1,-sin225]] );
        
}

octagon(10,10);