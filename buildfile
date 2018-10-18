./ : lib{nlohmann_json} doc{LICENSE.MIT README.md} manifest test/

# Header-only library.
#
lib{nlohmann_json}: include/nlohmann/hxx{**}

cxx.poptions =+ "-I$src_root/include"
lib{nlohmann_json}: cxx.export.poptions = "-I$src_root"

# Install headers into the nlohmann/ subdirectory of, say, /usr/include/
# recreating subdirectories.
#
include/nlohmann/hxx{*}: install         = include/nlohmann/
include/nlohmann/hxx{*}: install.subdirs = true

# TODO: port Google Benchmarks 
# Benhcmarks
#
#benchmarks/
#{
#  exe{json_benchmarks} : src/cxx{benchmarks}
#}

# Unit tests.
#
test/
{
 exe{*}: test = true
 exe{*}: install = false  
 
 for t: src/cxx{unit-*}
 {
   n = $name($t)        
   ./: exe{$n}
   exe{$n}: $t src/cxx{unit}
 }  
 
 cxx.poptions =+ "-I$src_base/thirdparty/catch"
 cxx.poptions =+ "-I$src_base/thirdparty/fifo_map"  
 
 # Include into distribution.
 #
 ./: data/file{**} thirdparty/file{**}
}
