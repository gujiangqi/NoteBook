1. 设置CppincludePath
    * shift + ctrl + p
    * edit configuration
    * includePath
2. 加入C++11特性
    ```json
      "args": [
        "-g",
       "-std=c++11",
        "${file}",
        "-o",
        "D:\\02_Studying\\03_C++\\02_code\\build\\${fileBasenameNoExtension}.exe"
    ]
    ```