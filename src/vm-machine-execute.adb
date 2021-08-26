with VM.Program; use VM.Program;
with VM.Stack; use VM.Stack;

package body VM.Machine.Execute is

    function Execute_Instruction_Push
        (Machine : in out Machine_Type;
         W       : in     Word_Type)
    return Error_Enum is
        Stack : Stack_Type renames Machine.Stack;
        Stack_Pointer : Stack_Pointer_Type renames Machine.Stack_Pointer;
    begin
        if Stack_Pointer > Stack_Index_Type'Last then
            return ERR_STACK_OVERFLOW;
        end if;

        Stack (Stack_Pointer) := W;
        Stack_Pointer := Stack_Pointer + 1;
        
        return ERR_OK;
    end Execute_Instruction_Push;


    function Execute_Instruction_Pop 
        (Machine : in out Machine_Type)
    return Error_Enum is
        Stack_Pointer : Stack_Pointer_Type renames Machine.Stack_Pointer;
    begin
        if Stack_Pointer <= (Stack_Pointer_Type'First) then
            return ERR_STACK_UNDERFLOW;
        end if;

        Stack_Pointer := Stack_Pointer - 1;

        return ERR_OK;
    end Execute_Instruction_Pop;


    function Execute_Instruction_Add 
        (Machine : in out Machine_Type)
    return Error_Enum is
        Stack : Stack_Type renames Machine.Stack;
        Stack_Pointer : Stack_Pointer_Type renames Machine.Stack_Pointer;
    begin
        if Stack_Pointer <= (Stack_Pointer_Type'First + 1) then
            return ERR_STACK_UNDERFLOW;
        end if;

        Stack_Pointer := Stack_Pointer - 1;
        Stack (Stack_Pointer - 1) := Stack (Stack_Pointer - 1) + Stack (Stack_Pointer);

        return ERR_OK;
    end Execute_Instruction_Add;


    function Execute_Instruction_Sub 
        (Machine : in out Machine_Type)
    return Error_Enum is
        Stack : Stack_Type renames Machine.Stack;
        Stack_Pointer : Stack_Pointer_Type renames Machine.Stack_Pointer;
    begin
        if Stack_Pointer <= (Stack_Pointer_Type'First + 1) then
            return ERR_STACK_UNDERFLOW;
        end if;

        Stack_Pointer := Stack_Pointer - 1;
        Stack (Stack_Pointer - 1) := Stack (Stack_Pointer - 1) - Stack (Stack_Pointer);

        return ERR_OK;
    end Execute_Instruction_Sub;


    function Execute_Instruction_Mul
        (Machine : in out Machine_Type)
    return Error_Enum is
        Stack : Stack_Type renames Machine.Stack;
        Stack_Pointer : Stack_Pointer_Type renames Machine.Stack_Pointer;
    begin
        if Stack_Pointer <= (Stack_Pointer_Type'First + 1) then
            return ERR_STACK_UNDERFLOW;
        end if;

        Stack_Pointer := Stack_Pointer - 1;
        Stack (Stack_Pointer - 1) := Stack (Stack_Pointer - 1) * Stack (Stack_Pointer);

        return ERR_OK;
    end Execute_Instruction_Mul;


    function Execute_Instruction_Div
        (Machine : in out Machine_Type)
    return Error_Enum is
        Stack : Stack_Type renames Machine.Stack;
        Stack_Pointer : Stack_Pointer_Type renames Machine.Stack_Pointer;
    begin
        if Stack_Pointer <= (Stack_Pointer_Type'First + 1) then
            return ERR_STACK_UNDERFLOW;
        end if;

        if Stack (Stack_Pointer - 1) = 0 then
            return ERR_DIV_ZERO;
        end if;

        Stack_Pointer := Stack_Pointer - 1;
        Stack (Stack_Pointer - 1) := Stack (Stack_Pointer - 1) / Stack (Stack_Pointer);

        return ERR_OK;
    end Execute_Instruction_Div;


    function Execute_Instruction_Jmp
        (Machine : in out Machine_Type;
         W       : in     Word_Type)
    return Error_Enum is
    begin
        Machine.Instruction_Pointer := Instruction_Pointer_Type (W);

        return ERR_OK;
    exception
        when CONSTRAINT_ERROR => return ERR_UNKNOWN_ADDR;
    end Execute_Instruction_Jmp;

end VM.Machine.Execute;