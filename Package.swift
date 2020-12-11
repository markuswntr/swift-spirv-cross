// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "swift-spirv-cross",
  products: [
    .library(name: "CSPIRVCross", targets: ["CSPIRVCross"]),
  ],
  targets: [
    .target(
      name: "CSPIRVCross",
      path: ".",
      exclude: [
        // A list of all files in the SPIRV-cross submodule (CSPIRV target) that
        // are of no interest for a Swift wrapper (like build instructions).
        //
        // The submodule is intentionally not cleaned from any resources or
        // unnecessary source files, as it must not deviate from the origin.
        // While none of them are needed for the target, this is merely a wrapper.
        "cmake",
        "gn",
        "include/spirv_cross",
        "include/CSPIRVCross.apinotes",
        "pkg-config",
        "reference",
        "samples",
        "shaders-hlsl-no-opt",
        "shaders-hlsl",
        "shaders-msl-no-opt",
        "shaders-msl",
        "shaders-no-opt",
        "shaders-other",
        "shaders-reflection",
        "shaders-ue4-no-opt",
        "shaders-ue4",
        "shaders",
        "tests-other",

        ".clang-format",
        ".gitignore",
        ".travis.yml",
        "CMakeLists.txt",
        "CODE_OF_CONDUCT.md",
        "LICENSE",
        "Makefile",
        "README.md",
        "appveyor.yml",
        "build_glslang_spirv_tools.sh",
        "checkout_glslang_spirv_tools.sh",
        "format_all.sh",
        "test_shaders.py",
        "test_shaders.sh",
        "update_test_shaders.sh",

        "spirv_cross_parsed_ir.hpp",
        "spirv_reflect.hpp",
        "spirv_cpp.hpp",
        "spirv_parser.hpp",
        "spirv_cross.hpp",
        "spirv_cross_util.hpp",
        "spirv_hlsl.hpp",
        "spirv.hpp",
        "spirv_msl.hpp",
        "spirv_glsl.hpp",
        "spirv_cross_error_handling.hpp",
        "spirv_cross_containers.hpp",
        "spirv_cfg.hpp",
        "spirv_common.hpp",

        "main.cpp",
      ], cxxSettings: [
        .define("SPIRV_CROSS_C_API_CPP", to: "0"), // According to the docs, it is deprecated
        .define("SPIRV_CROSS_C_API_GLSL", to: "1"),
        .define("SPIRV_CROSS_C_API_HLSL", to: "1"),
        .define("SPIRV_CROSS_C_API_MSL", to: "1"),
        .define("SPIRV_CROSS_C_API_REFLECT", to: "1"), // JSON
      ]
    ),
  ],
  cxxLanguageStandard: .cxx14
)
