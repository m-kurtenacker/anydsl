set(AnyDSL_PKG_JSON_URL "https://github.com/nlohmann/json.git" CACHE STRING "where to download JSON")

find_package(nlohmann_json QUIET)
if(((NOT nlohmann_json_FOUND) OR AnyDSL_PKG_JSON_AUTOBUILD) AND NOT CMAKE_DISABLE_FIND_PACKAGE_nlohmann_json)
    if (NOT AnyDSL_PKG_JSON_AUTOBUILD)
        message(WARNING
"AnyDSL_PKG_JSON_AUTOBUILD was set to OFF, but CMake could not find nlohmann_json.
We will therefore download it anyways.
To get rid of this warning, either set nlohmann_json_DIR or enable AnyDSL_PKG_JSON_AUTOBUILD.")
    endif()

    include(FetchContent)

    FetchContent_Declare(JSON
        GIT_REPOSITORY  ${AnyDSL_PKG_JSON_URL}
    )

    set(JSON_BuildTests OFF CACHE INTERNAL "")

    message(STATUS "Make JSON available ...")
    FetchContent_MakeAvailable(JSON)
endif()
