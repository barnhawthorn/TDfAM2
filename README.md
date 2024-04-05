# TDfAM2
**Temporal Design for Additive Manufacturing**, a G-code post-processing program that enables variation in nozzle temperature or print speed in user specified regions of the build. Compatible with G-code sliced in Cura.

This repository contains an in-silico proof in principle Matlab code to support Temporal Design for Additive Manufacturing (TDfAM). The development of the code has been published in The International Journal of Advanced Manufacturing Technology which can be found at https://doi.org/10.1007/s00170-024-13532-9 or in PDF format within this repository. 

Matlab and the associated license is required to run the programme. The software is licensed through an MIT license. 

The programme allows the user to apply TDfAM to any G-code file or pre-sliced geometry. It was developed and tested using G-code produced in UltiMaker's Cura 4.4
https://ultimaker.com/software/ultimaker-cura/. Whilst the code has been tested experimentally using an UltiMaker S5 and a Creality Ender 3 V2, please note the following text in the license file:

> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

How to use the program:
1. Ensure both files: "*TDfAM_Editor.m*" and "*appTDfAM_inputUI.m*" are saved in the same directory.
2. Save the G-code you wish to edit in this directory.
3. Open the *TDfAM_Editor.m* in Matlab, and run the program.
4. Navigate to your G-code and load it in to the program.
5. Use the user interface to select the desired variation to G-code.
6. Click confirm.

You may contact Barnaby Hawthorn directly on BXH481@bham.ac.uk.

