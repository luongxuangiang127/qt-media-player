# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appqt-media-player_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appqt-media-player_autogen.dir\\ParseCache.txt"
  "appqt-media-player_autogen"
  )
endif()
