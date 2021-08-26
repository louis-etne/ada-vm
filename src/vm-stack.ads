with VM.Word; use VM.Word;

package VM.Stack is

    STACK_SIZE : constant Positive := 1024;

    type Stack_Pointer_Type is range 1 .. (STACK_SIZE + 1);
    subtype Stack_Index_Type is Stack_Pointer_Type range Stack_Pointer_Type'First .. Stack_Pointer_Type (STACK_SIZE);
    type Stack_Type is array ( Stack_Index_Type ) of Word_Type;

end VM.Stack;