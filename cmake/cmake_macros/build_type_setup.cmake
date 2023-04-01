if ( NOT CMAKE_BUILD_TYPE )
    set( CMAKE_BUILD_TYPE  Release )
endif()

if ( CMAKE_BUILD_TYPE MATCHES "Release" OR CMAKE_BUILD_TYPE MATCHES "RelWithDebInfo" )
    set( C4BuildTypeDefinition C4_OPTIMIZED)
elseif (CMAKE_BUILD_TYPE MATCHES "Debug"  )
    set( C4BuildTypeDefinition C4_DEBUG)
else( )
    message( FATAL_ERROR    "Unsupported build type. Build type can be either \
                            Release, RelWithDebInfo or Debug." )
endif( )
