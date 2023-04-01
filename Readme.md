# C4Engine engine worked examples
This is a collection of basic examples for C4Engine (https://c4engine.com/). The examples are replacing the default Visual Studio solution with a CMake based build system.
## Why a CMake template
Besides CMake being the build tool I am mostly familiar with, there are some additional reasons that motivated developing a CMake based toolchain. These are: (a) Enabling code sharing in a way that makes compilation and execution of user applications an easy task; This is currently not easy with the C4 Engine because one needs to respect its license and the introduction of other source code involves many manual steps (b) Automate a number of bulding tasks, (c) Enable easier team-working by disengaging certain parts of the engine, and (d) CMake appears to becoming the defacto C++ build tool: it is supported by most IDEs, and is very popular within the C++ user community.

## C4Engine CMake template 
The C4Engine engine CMake template offers a number of features that ease the development of applications, particularly for people used to working with CMake. The template:
1. Provides a platform for sharing and team working on a C4Engine project yet honoring the sweat of the C4Engine engine developers by allowing easy compliance with the C4Engine license requirements.
2. Offers non-intrusive access to the C4Engine source code.
3. Provides automatic import of resources that have been modified, like textures and string files.
4. Enables projects to fully enclose their source code and resources; there are no folders shared between the Engine, Tools and user projects.
5. Enables easy setup of new applications. There is no need to manually configure  multiple files, just clone the project specific files. 
6. Allows multiple projects to share the same C4Engine source code and C4Engine resources.
7. Offers automatic installer generation based on NSIS ( Nullsoft Scriptable Install System).

## How to use the template
1. The hard part: Decide if you want to make the C4 Engine code a part of your project or not. 
    * If you plan to share your application source code publicly, or with entities that do not hold a C4 license then you are probably not allowed to make the C4 Engine code and resources part of it; or If you do not plan to modify the C4 Engine code then you can place the Engine Code and Data at any accesible location and possibly share it amongst your projects.
    * If you plan to modify the C4 Code as part of your project, then it is advisable to copy the Engine Code and Data in a location in your source directroy. The reasons for that is that it allows for source versioning control and makes it easy for IDEs to detect the source files. Your project folder structure will then look like:
```
            |v MyGame
              |> cmake
              |v C4Engine <- Place the C4 Engine code and data here
                |> Data
                |> EngineCode
                ...
              |> src
              | CMakeLists.txt
              | Readme.md
              | ...
 ```
 2. Set the C4CodeRoot and C4DataRoot in your IDE, or through the cmake command to point to the C4 root folder.The contents of each of the folders can be merged and defined for example to `C:\users\john\source\MyGame\C4Engine`   
 3. Run cmake to generate the project
 4. Compile
 5. Run
 
 ## Example configuration using Visual Studio 2019
 
# User selectable options
There are several selectable options, alhthough using the defaults is usually preferable. The `C4CodeRoot` and `C4DataRoot` are not optional and should point to the C4Engine main folder(s).

| Name                       |   Default    | Description                                                                                                                                                                                                                                                                                                      |
|----------------------------|:------------:|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `C4CodeRoot`               |     Empty    | C4Engine engine code path. Usually placed in a common location for access by multiple projects. Alternatively, the contents can be placed in a project subfolder, and the source code modified if desired. If Empty errors out.                                                                                  |
| `C4DataRoot`               |     Empty    | C4Engine engine data path. It is usually placed in a common location for access by multiple projects. Alternatively, the contents can be placed in a project subfolder and the resources modified if desired.  If Empty errors out.                                                                              |
| `C4ActiveApp`              |     Empty    | C4Engine active application. This will define which .dll the C4Engine.exe will load upon execution. If Empty the first application included is activated. If you wish to change the current app, change this variable in your cmake configuration such that appropriate files are copied, symlinked and imported.|
| `C4ForceCopyEngineImport`  |    `false`   | Copy the Engine Import directory instead of creating a symlink.                                                                                                                                                                                                                                                  |
| `C4ForceCopyToolsData`     |    `false`   | Copy the Tools Data directory instead of creating a symlink.                                                                                                                                                                                                                                                     |
| `C4ForceCopyToolsImport`   |    `false`   | Copy the Tools Import directory instead of creating a symlink.                                                                                                                                                                                                                                                   |
| `C4BuildThe31st`           |    `false`   | Optionally build the game "The 31st"                                                                                                                                                                                                                                                                             |
| `C4ForceCopyThe31stData`   |    `false`   | Copy the Te31st data directory instead of creating a symlink.                                                                                                                                                                                                                                                    |
| `C4ForceCopyThe31stImport` |    `false`   | Copy the Te31st import directory instead of creating a symlink.                                                                                                                                                                                                                                                  |
| `C4InfiniteShadowResolution`  |      `0`     | If other than `0`, overrides the default shadow map size (1024).                                                                                                                                                                                                                                                 |
| `C4EnableBuildTimeImport`  |    `true`    | Modify C4 Engine source code to enable importing resources during build time.                                                                                                                                                                                                                                    |
| `C4InstallPlugins`         |    `false`   | Install C4 Plugins alongside applications and data.                                                                                                                                                                                                                                                              |
| `C4PackUponInstall`        |    `true`    | Pack the data upon cmake install. Affects the contents of the installer or bundled app.                                                                                                                                                                                                                          | 
| `C4UseNSIS`                |    'false`   | Use NSIS to create an installer. If false use zip to create a bundled app.                                                                                                                                                                                                                                       |

In Visual Studio the items above can be changed by accessing the `Configuration` drop down menu and selecting `Manage Configurations`. Then after making the desired change and saving the .json file, cmake will be reconfigured.
## Changing the current application
To change the active application, modify the `C4ActiveApp` variable and re-configure cmake. This will update the game.cfg file, but also other directories and files that may need to be modified. 
