if(${PROJECT_NAME}_ENABLE_CONAN)
  if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
    message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
    file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/master/conan.cmake"
            "${CMAKE_BINARY_DIR}/conan.cmake")
  endif()

  include(${CMAKE_BINARY_DIR}/conan.cmake)

  conan_cmake_run(
          CONANFILE
          ${PROJECT_SOURCE_DIR}/conanfile.txt
          BASIC_SETUP
          CMAKE_TARGETS
          BUILD
          missing
  )

  verbose_message("Conan is setup and all requires have been installed.")
endif()
