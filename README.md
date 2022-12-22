# UART_RX

--------------------------------------------------RTL PART--------------------------------------------------------------

Specifications: -
- UART TX receive a UART frame on S_DATA.
- UART_RX support oversampling by 8
- S_DATA is high in the IDLE case (No transmission).
- PAR_ERR signal is high when the calculated parity bit not equal
the received frame parity bit as this mean that the frame is
corrupted.
- STP_ERR signal is high when the received stop bit not equal 1 as
this mean that the frame is corrupted.

- DATA is extracted from the received frame and then sent
through P_DATA bus associated with DATA_VLD signal only after
checking that the frame is received correctly and not corrupted.

(PAR_ERR = 0 && STP_ERR = 0).
- UART_RX can accept consequent frames.
- Registers are cleared using asynchronous active low reset

- PAR_EN (Configuration)
0: To disable frame parity bit
1: To enable frame parity bit

- PAR_TYP (Configuration)
0: Even parity bit
1: Odd parity bit




All Expected Received Frames: -

1. Data Frame (in case of Parity is enabled & Parity Type is even)
– One start bit (1'b0)
– Data (LSB first or MSB, 8 bits)
– Even Parity bit
– One stop bit


2. Data Frame (in case of Parity is enabled & Parity Type is odd)
– One start bit (1'b0)
– Data (LSB first or MSB, 8 bits)
– Odd Parity bit
– One stop bit

3. Data Frame (in case of Parity is not Enabled)
– One start bit (1'b0)
– Data (LSB first or MSB, 8 bits)
– One stop bit

----------------------------------------BACK END PART-------------------------------------------------------------------------------

SYN.zip (synthesis operation outputs) contains:

0- Synthesis script >> syn_script.tcl

1- Synthesis log >> syn.log

2- Technology Dependent Gate Level Netlist >> UART_RX.v

3- Area report >> Area.rpt

4- Power report >> power.rpt

5- Hold analysis report >> hold.rpt

6- Setup analysis report >> setup.rpt

7- Clocks report >> clocks.rpt

8- Constraints report >> constraints.rpt

9- Ports report >> ports.rpt

10- SVF File >> UART_RX.svf

11- SDF File >> UART_RX.sdf


DFT.zip(DFT operation outputs) contains:
0- dft script >> dft_script.tcl

1- dft log >> dft.log

2- Technology Dependent Gate Level Netlist >> UART_RX.v

3- Area report >> Area.rpt

4- Power report >> power.rpt

5- Hold analysis report >> hold.rpt

6- Setup analysis report >> setup.rpt

7- Clocks report >> clocks.rpt

8- Constraints report >> constraints.rpt

9- Ports report >> ports.rpt

10- Coverage Report >> dft_drc_post_dft.rpt



POST SYN Formality.zip (formal verfication after doing synthesis):
0- Formality script >> fm_script.tcl

1- Formality log >> fm.log

2- Matched points report >> passing_points.rpt

3- Unmatched points report >> failing_points.rpt


4- Unverified Points report >> unverified_points.rpt

5- Aborted Points report >> aborted_points.rpt


POST DFT Formality.zip (formal verfication after doing DFT):

0- Formality script >> dft_fm_script.tcl

1- Formality log >> dft_fm.log

2- Matched points report >> passing_points.rpt

3- Unmatched points report >> failing_points.rpt

4- Unverified Points report >> unverified_points.rpt

5- Aborted Points report >> aborted_points.rpt



