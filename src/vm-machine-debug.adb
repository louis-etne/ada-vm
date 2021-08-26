with Ada.Text_IO;
with VM.Word; use VM.Word;
with VM.Stack; use VM.Stack;

package body VM.Machine.Debug is

    procedure Process_Error (Machine : Machine_Type; Err : Error_Enum) is
        package Instruction_Pointer_IO is new Ada.Text_IO.Integer_IO (Instruction_Pointer_Type);
        package IPIO renames Instruction_Pointer_IO;
    begin
        IPIO.Default_Width := 1;

        if Err /= ERR_OK then
            Ada.Text_IO.Put ("Program exited with error: " & Image (Err) & " at instruction line ");
            IPIO.Put (Machine.Instruction_Pointer);
            Ada.Text_IO.New_Line;
        end if;
    end Process_Error;

    procedure Dump (Machine : Machine_Type) is
        package Word_IO is new Ada.Text_IO.Integer_IO (Word_Type);
    begin
        Word_IO.Default_Width := 1;
        Word_IO.Default_Base := 10;

        Ada.Text_IO.Put_Line ("Stack: " & Machine.Instruction_Pointer'Img);
        if Machine.Stack_Pointer = Stack_Pointer_Type'First then
            Ada.Text_IO.Put_Line ("  [empty]");
        else
            for I in Stack_Pointer_Type'First .. (Machine.Stack_Pointer - 1) loop
                Ada.Text_IO.Put ("  ");
                Word_IO.Put (Machine.Stack (I));
                Ada.Text_IO.New_Line;
            end loop;
        end if;
    end Dump;

end VM.Machine.Debug;