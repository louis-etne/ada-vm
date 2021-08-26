with VM.Error; use VM.Error;
with VM.Word; use VM.Word;

package VM.Machine.Execute is

    function Execute_Instruction_Push
        (Machine : in out Machine_Type;
         W       : in     Word_Type)
    return Error_Enum;

    function Execute_Instruction_Pop 
        (Machine : in out Machine_Type)
    return Error_Enum;

    function Execute_Instruction_Add
        (Machine : in out Machine_Type)
    return Error_Enum;

    function Execute_Instruction_Sub
        (Machine : in out Machine_Type)
    return Error_Enum;

    function Execute_Instruction_Mul
        (Machine : in out Machine_Type)
    return Error_Enum;

    function Execute_Instruction_Div
        (Machine : in out Machine_Type)
    return Error_Enum;

    function Execute_Instruction_Jmp
        (Machine : in out Machine_Type;
         W       : in     Word_Type)
    return Error_Enum;

end VM.Machine.Execute;