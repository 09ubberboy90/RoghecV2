/*
Copyright(c) 2019 Florent Audonnet: audoflo63@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files(the "Software"), to deal
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

*/


#include <xc.h>
#include "motor.h"
#include "pid.h"
#include "gyroscope.h"
#include "system.h"
#include <stdio.h>

#define DEAD_ZONE_DC_MOTOR_R 76          //125
#define DEAD_ZONE_DC_MOTOR_F 102
static PID_VALUE value;

void CorrecteurPID(float te,
                   float P,
                   float taui,
                   float taud,
                   float Nd)
{
    
    value.P = P;
    value.taui = taui;
    value.taud = taud;
    float alpha = taud / (1 + taud + Nd * te);


    numerateur[0] = P * (1.0 + taud / (Nd * te) + te / taui + taud / (Nd * taui) + taud / te);
    numerateur[1] = P * (-1 - 2 * taud / (Nd * te) - taud / (Nd * taui) - 2 * taud / te);
    numerateur[2] = P * (taud / (Nd * te) + taud / te);

    denominateur[0] = 1.0 + taud / (Nd * te);
    denominateur[1] = -1 - 2 * taud / (Nd * te);
    denominateur[2] = taud / (Nd * te);

}

float compute(float input)
{
    for (int i = 2; i > 0; i--)
    {
        mem_input[i] = mem_input[i - 1];   
    }
     mem_input[0] = input;
    
    for (int i = sizeof(mem_output) - 1; i > 0; i--)
    {
        mem_output[i] = mem_output[i - 1];
    }
    float out = 0;
    for (int i = 0; i < 2; i++)
        out += numerateur[i] * mem_input[i];
    for (int i = 1; i < 2; i++)
        out -= denominateur[i] * mem_output[i];

    /*    for (int i=0;i<numerateur.size();i++)  std::cout<<"numerateur["<<i<<"] = "<< numerateur[i]<<std::endl;
    for (int i=0;i<denominateur.size();i++)  std::cout<<"denominateur["<<i<<"] = "<< denominateur[i]<<std::endl;

    for (int i=0;i<mem_input.size();i++)  std::cout<<"mem_input["<<i<<"] = "<< mem_input[i]<<std::endl;
    for (int i=0;i<mem_output.size();i++)  std::cout<<"mem_output["<<i<<"] = "<< mem_output[i]<<std::endl;  */

    out /= denominateur[0];
    mem_output[0] = out;
    return out;

}

PID_VALUE * Get_PID(){
    return &value;
}

