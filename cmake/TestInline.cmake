
FOREACH(KEYWORD "inline" "__inline__" "__inline")
   IF(NOT DEFINED C_INLINE)
     TRY_COMPILE(C_HAS_${KEYWORD} "${CMAKE_CURRENT_BINARY_DIR}"
       "${CMAKE_CURRENT_SOURCE_DIR}/cmake/TestInline.c"
       COMPILE_DEFINITIONS "-Dinline=${KEYWORD}"
           OUTPUT_VARIABLE  ASD
     )

     IF(C_HAS_${KEYWORD})
       SET(C_INLINE TRUE)
       SET(C_INLINE_VAL ${KEYWORD})
       #ADD_DEFINITIONS("-Dinline=${KEYWORD}")
     ENDIF(C_HAS_${KEYWORD})

   ENDIF(NOT DEFINED C_INLINE)
ENDFOREACH(KEYWORD)

IF(NOT DEFINED C_INLINE)
    MESSAGE(STATUS "Inline support not found")
ELSE(NOT DEFINED C_INLINE)
    MESSAGE(STATUS "Inline support found: ${C_INLINE_VAL}")
ENDIF(NOT DEFINED C_INLINE)

