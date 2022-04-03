<img align="left" src="https://raw.githubusercontent.com/SublimeText/AFileIcon/74e3c8ec7141814eba04aec95a85a8af938a4c61/icons/multi/file_type_vhdl%403x.png" width="40px" height="40px"/>Main Circuit
====
|  AC = Accumulator Register 16 Bit Data |
|---|
|  DR = Data Register 16 Bit Data |
|  INP = Input Register 16 Bit Data |
|  sec = MUX Selection Input |
|  C = Carry Input|
|  Cout = Carry Output|
|  Sonuc = Result|

| SELECT | OPERATION |
|--|--|
| <center> 0000 </center> | AC + DR|
| <center> 0001 </center> | AC - DR|
| <center> 0010 </center> | AC + DR + C|
| <center> 0011 </center> | AC + DR'|
| <center> 0100 </center> | DR|
| <center> 0101 </center> | DR + 1|
| <center> 0110 </center> | INP|
| <center> 0111 </center> | INP + 1|
| <center> 1000 </center> | AC + 1|
| <center> 1001 </center> | AC - 1|
| <center> 1010 </center> | DR - 1|
| <center> 1011 </center> | AC and DR|
| <center> 1100 </center> | AC or DR|
| <center> 1101 </center> | AC xor DR|
| <center> 1110 </center> | ror(AC)|
| <center> 1111 </center> | rol(AC)|
