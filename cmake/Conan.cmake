if(${PROJECT_NAME}_ENABLE_CONAN)
  if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
    message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
    file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/master/conan.cmake"
            "${CMAKE_BINARY_DIR}/conan.cmake")
  endif()

  include(${CMAKE_BINARY_DIR}/conan.cmake)

  conan_add_remote(NAME bincrafters
          URL
          https://api.bintray.com/conan/bincrafters/public-conan
          )

  conan_cmake_run(
          REQUIRES
          ${CONAN_EXTRA_REQUIRES}
          OPTIONS
          ${CONAN_EXTRA_OPTIONS}
          BASIC_SETUP
          CMAKE_TARGETS # Individual targets to link to
          BUILD
          missing
  )

  verbose_message("Conan is setup and all requires have been installed.")
endif()
