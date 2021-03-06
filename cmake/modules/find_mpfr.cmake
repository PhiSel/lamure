##############################################################################
# search paths
##############################################################################
SET(MPFR_INCLUDE_SEARCH_DIRS
  ${GLOBAL_EXT_DIR}/mpfr/include
  /usr/include
  /opt/mpfr/include
)

SET(MPFR_LIBRARY_SEARCH_DIRS
  ${GLOBAL_EXT_DIR}/mpfr/lib
  /usr/lib
  /usr/lib/x86_64-linux-gnu
  /opt/mpfr/lib
)

##############################################################################
# search
##############################################################################
message(STATUS "-- checking for MPFR")

SET(MPFR_LIBRARY_FILENAMES "")

FOREACH (_SEARCH_DIR ${MPFR_LIBRARY_SEARCH_DIRS})
    FILE(GLOB _RESULT RELATIVE ${_SEARCH_DIR} "${_SEARCH_DIR}/libmpfr*" )
    IF (_RESULT) 
        FOREACH(_FILEPATH ${_RESULT})
            get_filename_component(_LIBNAME ${_FILEPATH} NAME)
            SET(MPFR_LIBRARY_FILENAMES ${MPFR_LIBRARY_FILENAMES} ${_LIBNAME})
        ENDFOREACH()
    ENDIF ()
ENDFOREACH()

find_path(MPFR_INCLUDE_DIR NAMES mpfr.h PATHS ${MPFR_INCLUDE_SEARCH_DIRS})

find_library(MPFR_LIBRARY NAMES mpfr libMPFR ${MPFR_LIBRARY_FILENAMES} PATHS ${MPFR_LIBRARY_SEARCH_DIRS})

##############################################################################
# verify
##############################################################################
IF ( MPFR_INCLUDE_DIR AND MPFR_LIBRARY)
  MESSAGE(STATUS "--  found matching MPFR version")
ELSE()
  MESSAGE(FATAL_ERROR "find_MPFR.cmake: unable to find MPFR library.")
ENDIF ()