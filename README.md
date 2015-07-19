# tourTip
Tour tip (JGHint)
============



URLs
----

* https://github.com/jgurnani/tourTip.git


Usage
-----

Example 1 - 

* Get a view array to be highlighted 


NSArray * viewArray = [[NSArray alloc]initWithObjects:_buttonToHighlight,_centerPressButton,_insertedNewButton,_bottomLeftButton, nil];

* Get the message array to be displayed as tip for each view in same order as view is in viewArray

NSArray * messageArray = [[NSArray alloc]initWithObjects:@"This is demo message for top right button",@"This is demo message for center button",@"Wow Here's the new button. It seems awesome to use !!!",@"This is demo button for bottom left button", nil];


// Initialize the JGTourTip Class and show tour tip
JGTourTip * tourTip = [[JGTourTip alloc]initWithViews:viewArray withMessages:messageArray onScreen:self.view];
[tourTip showTourTip];

License
-------

The MIT License (MIT)

Copyright (c) 2015 jgurnani

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

