./ : lib{nlohmann_json} doc{LICENSE.MIT README.md} manifest test/

# Header-only library.
#
lib{nlohmann_json}: include/nlohmann/hxx{**}
lib{nlohmann_json}: cxx.export.poptions = "-I$src_root/include"

# Install headers into the nlohmann/ subdirectory of, say, /usr/include/
# recreating subdirectories.
#
include/nlohmann/hxx{*}: install         = include/nlohmann/
include/nlohmann/hxx{*}: install.subdirs = true
