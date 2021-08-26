package VM.Error is

    type Error_Enum is (
        -- GENERAL
        ERR_OK,
        ERR_UNKNOWN,
        ERR_UNKNOWN_ADDR,

        -- STACK
        ERR_STACK_OVERFLOW,
        ERR_STACK_UNDERFLOW,

        -- MATH
        ERR_DIV_ZERO
    );

    function Image (Err : Error_Enum) return String;

end VM.Error;