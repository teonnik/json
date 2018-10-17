./ : doc{LICENSE.MIT README.md} manifest


lib{nlohmann_json} : ./include/nlohmann/{hxx}{**}
lib{nlohmann_json} : install = include/nlohmann_json

# TODO: Should install to `include/nlohmann_json` but may potentially conflict 
#       with the non-single-header distribution method (i.e. above) 
lib{nlohmann_json_single} : ./single_include/nlohmann/{hxx}{*}
lib{nlohmann_json_single} : install = include/nlohmann_json_single

libue{nlohmann_json} : ./include/nlohmann/{hxx}{**} \
                  ./test/thirdparty/catch/{hxx}{catch}

# TODO: benchmarks

./test/src/
{
  for t : cxx{*}
  {
    n = $name($t) 
  
    ./ : exe{$n}
    exe{$n} : test = true
    exe{$n} : install = false
    exe{$n} : $t libue{nlohmann_json}
  } 
}

