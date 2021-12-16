vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emilk/loguru
    REF 323d0eb1b7ba0bda39d9b8494aca456639bfd2d5  # post-v2.1.0
    SHA512 c3ae389588257d185425b1040fd8b2016d7203c015aea5ebc964f48b74adf99dd8b0c5bfc77ac8ae55bb7cebdfd307db3d02a59786906afea888908ff7e845d7
    HEAD_REF master
)

if(VCPKG_TARGET_IS_WINDOWS)
    file(INSTALL ${SOURCE_PATH}/loguru.hpp DESTINATION ${CURRENT_PACKAGES_DIR}/include/loguru)
    file(INSTALL ${SOURCE_PATH}/loguru.cpp DESTINATION ${CURRENT_PACKAGES_DIR}/include/loguru)
endif()

if(VCPKG_TARGET_IS_LINUX OR VCPKG_TARGET_IS_OSX)
    configure_file(${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt ${SOURCE_PATH}/CMakeLists.txt COPYONLY)
    configure_file(${CMAKE_CURRENT_LIST_DIR}/loguru-fmt-config.cmake.in  ${SOURCE_PATH}/loguru-fmt-config.cmake.in COPYONLY)

    vcpkg_configure_cmake(
        SOURCE_PATH ${SOURCE_PATH}
        PREFER_NINJA
        OPTIONS_DEBUG
            -DINSTALL_HEADERS=OFF
     )

    vcpkg_install_cmake()
    vcpkg_fixup_cmake_targets()
    vcpkg_copy_pdbs()
endif()

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/copyright DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})
